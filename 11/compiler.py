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
from typing import Union, List
from dataclasses import dataclass
import uuid

def uniqueString():
	return 'X' + str(uuid.uuid4()).replace('-', '')

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

	def writeToFile(self, string: str):
		if 'constant -1' in string:
			raise Exception('not good')
		self.file.write(string + '\n')
		print(string)

	def popVariable(self, symbol: Symbol):
		self.writePop(symbol.modifier.toSegment(), symbol.assignedIndex)

	def pushVariable(self, symbol: Symbol):
		self.writePush(symbol.modifier.toSegment(), symbol.assignedIndex)

	def writePush(self, segment: Segments, value: int):
		# if segment == Segments.Constant and value == -1:
		# 	raise Exception('hello')

		self.writeToFile(f'push {segment.toString()} {value}')

	def writePop(self, segment: Segments, value: int):
		self.writeToFile(f'pop {segment.toString()} {value}')

	def getParameters(self, subroutine: SubroutineDefinitionNode):
		if subroutine.subroutineType == SubroutineType.Function:
			return subroutine.parameters

	def getSymbolByName(self, varName: str):
		try:
			return self.compositeSub[self.currentClass.className][self.currentSubroutine.subroutineName][varName]
		except KeyError:
			return self.compositeClass[self.currentClass.className][varName]

	def getLocalCount(self, subroutineName):
		subroutineLevel = self.compositeSub[self.currentClass.className]
		return sum(1 for sym in subroutineLevel[subroutineName].values() if sym.modifier == VariableModifier.Local)

	def getArgumentCount(self, subroutineName):
		subroutineLevel = self.compositeSub[self.currentClass.className]
		return sum(1 for sym in subroutineLevel[subroutineName].values() if sym.modifier == VariableModifier.Parameter)

	def getFieldCount(self, className):
		classLevel = self.compositeClass[self.currentClass.className]
		return sum(1 for sym in classLevel.values() if sym.modifier == VariableModifier.Field)

	def constructSymbolTableComplete(self, nodes: List[ClassDefinitionNode]):
		self.compositeClass = {}
		self.compositeSub = {}
		for node in nodes:
			classLevel, subLevel = self.constructSymbolTable(node)
			self.compositeClass[node.className] = classLevel
			self.compositeSub[node.className] = subLevel

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

		return classLevel, subroutineLevel
		# self.classLevel = classLevel
		# self.subroutineLevel = subroutineLevel

	def compileClass(self, node: ClassDefinitionNode, pathRoot, addInitCall: bool):
		path = Path(pathRoot) / (node.className + '.vm')
		self.file = open(path, 'w')

		if addInitCall:
			self.writeToFile('call Sys.init 0')
			# self.writeToFile('')

		# self.constructSymbolTable(node)
		self.currentClass = node

		# print(self.classLevel)
		self.writeCode(node)

	def receiveClasses(self, classes: List[ClassDefinitionNode]):
		self.allClasses = { cls.className: cls for cls in classes }
		comp.constructSymbolTableComplete(classes)

	@singledispatchmethod
	def writeCode(self, node):
		if type(node) is str:
			raise TypeError('Did you mean writeToFile?')
		# print('TODO raise not implemented')
		raise NotImplementedError('Unrecognized node type ' + repr(node))

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
		self.writeToFile(f'function {self.currentClass.className}.{node.subroutineName} {self.getLocalCount(node.subroutineName)}')
		if node.subroutineType == SubroutineType.Function:
			pass
		elif node.subroutineType == SubroutineType.Constructor:
			fieldCount = self.getFieldCount(self.currentClass.className)
			self.writePush(Segments.Constant, fieldCount)

			# Allocate memory
			self.writeToFile('call Memory.alloc 1')
			# Now `this` points to blank memory
			self.writePop(Segments.Pointer, 0)

		elif node.subroutineType == SubroutineType.Method:
			argCount = self.getArgumentCount(node.subroutineName)
			# Hidden (n+1)th argument
			self.writePop(Segments.This, argCount)

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
		symbol = self.getSymbolByName(node.varName)
		self.writePush(symbol.modifier.toSegment(), symbol.assignedIndex)

	@writeCode.register
	def _(self, node: LetStatementNode):
		symbol = self.getSymbolByName(node.varName)

		self.writeCode(node.rhsExpr)

		if node.hasIndex():
			# We're assuming the variable corresponds to an array
			# Let's get the memory address stored there
			self.pushVariable(symbol)

			# TODO optimization where if the index is a constant we use `pop that 4` for example
			self.writeCode(node.indexExpr)
			self.writeToFile('add')

			# Set `that` to the index
			self.writePop(Segments.Pointer, 1)

			self.writePop(Segments.That, 0)
		else:
			# symbol = self.classLevel[node.varName]
			self.writePop(
				symbol.modifier.toSegment(),
				symbol.assignedIndex
			)

	@writeCode.register
	def _(self, node: ArrayIndexTerm):
		symbol = self.getSymbolByName(node.varName)
		self.pushVariable(symbol)

		self.writeCode(node.index)
		self.writeToFile('add')
		self.writePop(Segments.Pointer, 1)

		self.writePush(Segments.That, 0)

	@writeCode.register
	def _(self, node: KeywordConstantTerm):
		if node.keyword == 'this':
			# Push the `this` memory address onto the stack
			self.writePush(Segments.Pointer, 0)
		elif node.keyword == 'true':
			self.writePush(Segments.Pointer, 0)
			self.writeToFile('not')
		else:
			self.writePush(Segments.Constant, {
				'false': 0,
				'null': 0
			}[node.keyword])

	@writeCode.register
	def _(self, node: TermExpression):
		self.writeCode(node.term)
	#
	# def getParameterCount(self, className, subroutineName):
	# 	self.compositeSub[className][subroutineName]

	@writeCode.register
	def _(self, node: SubroutineCallExpression):
		# if not node.isObjMethod():
		# 	raise Exception('todo call')

		for arg in node.argumentList:
			self.writeCode(arg)

		if node.isObjMethod():
			self.writeToFile(f'call {node.objName}.{node.methodName} {len(node.argumentList)}')
		else:
			# Push `this` pointer as (n+1)th argument
			self.writePush(Segments.Pointer, 0)
			self.writeToFile(f'call {self.currentClass.className}.{node.objName} {len(node.argumentList) + 1}')


	@writeCode.register
	def _(self, node: IfStatementNode):
		label1 = uniqueString()
		label2 = uniqueString()

		self.writeCode(node.conditionExpr)
		self.writeToFile('not')
		self.writeToFile('if-goto ' + label1)
		self.writeCode(node.positiveStatements)
		self.writeToFile('goto ' + label2)
		self.writeToFile('label ' + label1)
		if node.hasElse():
			self.writeCode(node.negativeStatements)
		self.writeToFile('label ' + label2)

	@writeCode.register
	def _(self, node: WhileStatementNode):
		label1 = 'LABEL1_' + uniqueString()
		label2 = 'LABEL2_' + uniqueString()

		self.writeToFile('label ' + label1)
		self.writeCode(node.conditionExpr)
		self.writeToFile('not')
		self.writeToFile('if-goto ' + label2)
		self.writeCode(node.statements)
		self.writeToFile('goto ' + label1)
		self.writeToFile('label ' + label2)

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
		if node.operator == '*':
			self.writeToFile('call Math.multiply 2')
		elif node.operator == '/':
			self.writeToFile('call Math.divide 2')
		else:
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

	@writeCode.register
	def _(self, node: StringConstantTerm):
		self.writePush(Segments.Constant, len(node.stringValue))
		self.writeToFile('call String.new 1')
		self.writePop(Segments.Temp, 1)
		for c in node.stringValue:
			self.writePush(Segments.Constant, ord(c))
			self.writeToFile('call String.appendChar 2')




if __name__ == '__main__':
	classes = parseAll(sys.argv[1])
	comp = Compiler()
	comp.receiveClasses(classes)

	for classNode in classes:
		path = Path(sys.argv[1])
		if path.is_file():
			path = path.parent

		# TODO add a validation step i.e. no duplicated variable names, flow analysis, etc.
		# TODO Voids not being used in expressions, void matches return statements
		comp.compileClass(classNode, path, True)


