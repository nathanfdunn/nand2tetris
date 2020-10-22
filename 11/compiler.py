from parser import (
	parseAll,
	ClassVarType,
	SubroutineType,
)

from parser import (
	SubroutineParameter,
	LocalVariable,
	TermExpression,
	BinaryExpression,
	ParentheticalTerm,
	IntegerConstantTerm,
	StringConstantTerm,
	KeywordConstantTerm,
	VarNameTerm,
	ArrayIndexTerm,
	UnaryOperatorTerm,
	SubroutineCallExpression,
	DoStatementNode,
	LetStatementNode,
	StatementBlockNode,
	WhileStatementNode,
	IfStatementNode,
	ReturnStatementNode,
	ClassVar,
	ClassDefinitionNode,
	SubroutineDefinitionNode,
)
import sys
from collections import defaultdict
from pathlib import Path
from enum import Enum
from functools import singledispatchmethod
from typing import Union
from dataclasses import dataclass

class VariableModifier(Enum):
	Static = 1
	Field = 2
	Parameter = 3
	Local = 4

	def toSegment(self):
		if self == VariableModifier.Static:
			return Segments.Static
		elif self == VariableModifier.Field:
			return Segments.This
		elif self == VariableModifier.Parameter:
			return Segments.Argument
		elif self == VariableModifier.Local:
			return Segments.Local

		raise Exception('Unknown Variable Modifier')


@dataclass
class Symbol:
	varName: str
	dataType: str
	modifier: VariableModifier
	assignedIndex: int

class Segments(Enum):
	Constant = 1
	Static = 2
	Argument = 3
	Pointer = 4
	This = 5
	That = 6
	Temp = 7
	Local = 8

	def toString(self):
		return self.name.lower()

class Compiler:
	# def __init__(self):
	# 	self.currentSubroutine = None

	def writeToFile(self, string):
		# self.file.write(string)
		print(string)

	def writePush(self, segment: Segments, value: int):
		self.writeToFile(f'push {segment.toString()} {value}')

	def writePop(self, segment: Segments, value: int):
		self.writeToFile(f'pop {segment.toString()} {value}')

	def getParameters(self, subroutine: SubroutineDefinitionNode):
		if subroutine.subroutineType == SubroutineType.Function:
			return subroutine.parameters

	def getLocalCount(self, subroutineName):
		return sum(1 for sym in self.subroutineLevel[subroutineName].values() if sym.modifier == VariableModifier.Local)

	def constructSymbolTable(self, node: ClassDefinitionNode):
		classLevel = {}
		subroutineLevel = defaultdict(dict)
		for var in node.vars:
			varModifier = VariableModifier.Static if var.varType == ClassVarType.Static else VariableModifier.Field
			classLevel[var.varName] = Symbol(
				var.varName,
				var.varType,
				varModifier,
				len(classLevel)
				)

		for sub in node.subroutines:
			index = 0
			for param in sub.parameters:
				subroutineLevel[sub.subroutineName][param.paramName] = Symbol(
					param.paramName,
					param.paramType,
					VariableModifier.Parameter,
					index
					)

				index += 1

			index = 0
			for localVar in sub.localVariables:
				subroutineLevel[sub.subroutineName][localVar.varName] = Symbol(
					localVar.varName,
					localVar.varType,
					VariableModifier.Local,
					index
					)

				index += 1

		self.classLevel = classLevel
		self.subroutineLevel = subroutineLevel

	def compileClass(self, node: ClassDefinitionNode, pathRoot):
		path = Path(pathRoot) / (node.className + '.vm')
		self.file = open(path, 'w')
		self.constructSymbolTable(node)
		self.currentClass = node

		# print(self.classLevel)
		# print(self.subroutineLevel)
		self.writeCode(node)


	@singledispatchmethod
	def writeCode(self, node):
		if type(node) is str:
			raise TypeError('Did you mean writeToFile?')
		print('TODO raise not implemented')
		# raise NotImplementedError('Unrecognized node type ' + repr(node))

	@writeCode.register
	def _(self, node: ClassDefinitionNode):
		# for var in node.vars:
			# self.writeToFile(var)
		# self.writeToFile(str(node))
		for subroutine in node.subroutines:
			self.writeCode(subroutine)

	@writeCode.register
	def _(self, node: SubroutineDefinitionNode):
		self.currentSubroutine = node
		# self.subroutineLevel
		self.writeToFile(f'function {self.currentClass.className}.{node.subroutineName} {self.getLocalCount(node.subroutineName)}')
		self.writeCode(node.statementBlock)

	@writeCode.register
	def _(self, node: StatementBlockNode):
		for stmt in node.statements:
			self.writeCode(stmt)

	@writeCode.register
	def _(self, node: DoStatementNode):
		self.writeCode(node.subroutineCall)
		# TODO figure out if this is safe
		self.writePop(Segments.Temp, 7)
		# self.writePop(Segments.)
		# 	TODO get rid of spurious return value

	@writeCode.register
	def _(self, node: VarNameTerm):
		pass

	@writeCode.register
	def _(self, node: LetStatementNode):
		self.writeCode(node.rhsExpr)
		if node.hasIndex():
			raise Exception('todo')

		# self.subroutineLevel[self.currentSubroutine.subroutineName][node.varName].modifier
		symbol = self.classLevel[node.varName]
		self.writePop(
			symbol.modifier.toSegment(),
			symbol.assignedIndex
		)

	@writeCode.register
	def _(self, node: TermExpression):
		self.writeCode(node.term)

	@writeCode.register
	def _(self, node: SubroutineCallExpression):
		if not node.isObjMethod():
			raise Exception('todo call')

		for arg in node.argumentList:
			self.writeCode(arg)

		if node.isObjMethod():
			self.writeToFile(f'call {node.objName}.{node.methodName} {len(node.argumentList)}')
		else:
			raise NotImplementedError()



	@writeCode.register
	def _(self, node: IntegerConstantTerm):
		self.writePush(Segments.Constant, node.integerValue)

	@writeCode.register
	def _(self, node: UnaryOperatorTerm):
		self.writeCode(node.term)
		self.writeToFile({
			'~': 'not',
			'-': 'neg',
		}[node.operator])

	@writeCode.register
	def _(self, node: ParentheticalTerm):
		self.writeCode(node.expression)

	@writeCode.register
	def _(self, node: BinaryExpression):
		self.writeCode(node.first)
		self.writeCode(node.second)
		# TODO support multiplication and division
		self.writeToFile({
			'+': 'add',
			'&': 'and',
			'|': 'or',
			'-': 'sub',
			'>': 'gt',
			'<': 'lt',
			'=': 'eq'
		}[node.operator])

	@writeCode.register
	def _(self, node: ReturnStatementNode):
		if node.hasExpression():
			self.writeCode(node.returnExpr);
		else:
			# pass
			self.writePush(Segments.Constant, 0)

		self.writeToFile('return')


if __name__ == '__main__':
	for classNode in parseAll(sys.argv[1]):
		path = Path(sys.argv[1])
		if path.is_file():
			path = path.parent

		# TODO add a validation step i.e. no duplicated variable names, flow analysis, etc.
		# TODO Voids not being used in expressions, void matches return statements
		comp = Compiler()
		comp.compileClass(classNode, path)

