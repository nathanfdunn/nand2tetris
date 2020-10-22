import sys
import os
from enum import Enum
import re
from tokenizer import TokenStateMachine, commentChar, TokenType
from dataclasses import dataclass
from typing import List, Optional
from textwrap import indent

tab = "\t"
# class StatementType(Enum):
# 	Let = 1
# 	While = 2
# 	If = 3
# 	Return = 4

unaryOperators = '-~'
binaryOperators = '+-*/&|<>='


class ClassVarType(Enum):
	Static = 1
	Field = 2

	def __str__(self):
		return self.name.lower()

class SubroutineType(Enum):
	Function = 1
	Method = 2
	Constructor = 3

	@classmethod
	def parse(cls, text):
		ret = {
			'function': cls.Function,
			'method': cls.Method,
			'constructor': cls.Constructor
		}.get(text)

		if ret is None:
			raise ArgumentException(f'invalid sub type: {text}')

		return ret

	def toString(self):
		return self.name.lower()

@dataclass
class SubroutineParameter:
	paramType: str
	paramName: str

	def __str__(self):
		return f'{self.paramType} {self.paramName}'

@dataclass
class LocalVariable:
	varType: str
	varName: str

	def __str__(self):
		return f'var {self.varType} {self.varName}'


class StatementNode:
	# TODO add type?
	pass

class ExpressionNode:
	pass

class TermNode(ExpressionNode):
	pass

@dataclass
class TermExpression(ExpressionNode):
	term: TermNode

	def __str__(self):
		return str(self.term)

@dataclass
class BinaryExpression(ExpressionNode):
	first: TermNode
	operator: str
	second: ExpressionNode

	def __str__(self):
		return f'{self.first} {self.operator} {self.second}'

# @dataclass
# class UnaryExpression(TermNode):
# 	operator: str
# 	term: TermNode

# 	def __str__(self):
# 		return f'{self.operator}{self.term}'

@dataclass
class ParentheticalTerm(TermNode):
	expression: ExpressionNode

	def __str__(self):
		return f'({self.expression})'

@dataclass
class IntegerConstantTerm(TermNode):
	integerValue: int

	def __str__(self):
		return str(self.integerValue)

@dataclass
class StringConstantTerm(TermNode):
	stringValue: str

	def __str__(self):
		return f'"{self.stringValue}"'

@dataclass
class KeywordConstantTerm(TermNode):
	'''true, false, null, this'''
	keyword: str

	def __str__(self):
		return self.keyword

@dataclass
class VarNameTerm(TermNode):
	varName: str

	def __str__(self):
		return self.varName

@dataclass
class ArrayIndexTerm(TermNode):
	varName: str
	index: ExpressionNode

	def __str__(self):
		return f'{self.varName}[{self.index}]'

@dataclass
class UnaryOperatorTerm(TermNode):
	operator: str
	term: TermNode

	def __str__(self):
		return f'{self.operator}{self.term}'

@dataclass
class SubroutineCallExpression(ExpressionNode):
	objName: str
	methodName: str
	argumentList: List[ExpressionNode]

	def __str__(self):
		argString = ', '.join(str(arg) for arg in self.argumentList)
		target = f'{self.objName}.{self.methodName}' if self.methodName else self.objName
		return f'{target}({argString})'

	def isObjMethod(self):
		return self.methodName is not None


@dataclass
class DoStatementNode(StatementNode):
	subroutineCall: SubroutineCallExpression

	def __str__(self):
		return f'do {self.subroutineCall};'

@dataclass
class LetStatementNode(StatementNode):
	varName: str
	indexExpr: Optional[ExpressionNode]
	rhsExpr: ExpressionNode
	
	def __str__(self):
		indexStr = '' if self.indexExpr is None else f'[{self.indexExpr}]'
		return f'let {self.varName}{indexStr} = {self.rhsExpr};'

	def hasIndex(self):
		return self.indexExpr is not None

@dataclass
class StatementBlockNode:
	statements: List[StatementNode]

	def __str__(self):
		return '\n'.join(str(stmt) for stmt in self.statements)


@dataclass
class WhileStatementNode(StatementNode):
	conditionExpr: ExpressionNode
	statements: StatementBlockNode
	
	def __str__(self):
		return f'while ({self.conditionExpr}){{\n{indent(str(self.statements), tab)}\n}}'

@dataclass
class IfStatementNode(StatementNode):
	conditionExpr: ExpressionNode
	positiveStatements: StatementBlockNode
	negativeStatements: Optional[StatementBlockNode]

	def hasElse(self):
		return self.negativeStatements is not None

	def __str__(self):
		ret = (
			f'if ({self.conditionExpr}) {{\n' +
				indent(str(self.positiveStatements), tab) + "\n}"
		)
		if self.hasElse():
			ret += ('\nelse {\n' +
				indent(str(self.negativeStatements), tab) + '\n}'
		)
		return ret

@dataclass
class ReturnStatementNode(StatementNode):
	returnExpr: Optional[ExpressionNode]

	def hasExpression(self):
		return self.returnExpr is not None

	def __str__(self):
		if self.returnExpr is None:
			return 'return;'
		return f'return {self.returnExpr};'


class AstNode:
	def __init__(self, children):
		self.children = children

@dataclass
class ClassVar:
	varName: str
	modifier: ClassVarType
	varType: str

	def __str__(self):
		return f'{self.modifier} {self.varType} {self.varName};'
	# def __init__(self, varName, modifier, varType):
	# 	self.varName = varName
	# 	self.modifier = modifier
	# 	self.varType = varType

	# def __repr__(self):
	# 	return f'ClassVar({repr(self.varName)}, {repr(self.modifier)}, {repr(self.varType)})'



class SubroutineDefinitionNode(AstNode):
	def __init__(self, subroutineType, returnType, subroutineName, parameters: List[SubroutineParameter], localVariables: List[LocalVariable], statementBlock):
		self.subroutineType = subroutineType
		self.returnType = returnType
		self.subroutineName = subroutineName
		self.parameters = parameters
		self.localVariables = localVariables
		self.statementBlock = statementBlock

	def getParameterByName(self, paramName):
		for param in self.parameters:
			if param.paramName == paramName:
				return param

		return None

	def __str__(self):
		parmList = ', '.join(str(parm) for parm in self.parameters)
		localVariables = '\n'.join(f'\t{localVar};' for localVar in self.localVariables)
		if localVariables:
			localVariables += '\n'
		statementBlock = '\n'.join(f'{indent(str(statement), tab)}' for statement in self.statementBlock.statements)
		if statementBlock:
			statementBlock += '\n'
			# def __str__(self):
		# return '\n'.join(str(statement) for statement in self.statements)
		return (
			f'{self.subroutineType.toString()} {self.returnType} {self.subroutineName} ({parmList}) {{\n' + 
				localVariables +
				f'{statementBlock}}}'
			)

@dataclass
class ClassDefinitionNode(AstNode):
	# def __init__(self, className, vars, subroutines):
	# 	self.className = className
	# 	self.vars = vars
	# 	self.subroutines = subroutines
	className: str
	vars: List[ClassVar]
	subroutines: List[SubroutineDefinitionNode]	

	def __str__(self):
		varsSection = '\n'.join(str(var) for var in self.vars)
		if varsSection:
			varsSection = indent(varsSection, tab) + '\n\n'
		subroutines = '\n\n'.join(str(sub) for sub in self.subroutines)
		if subroutines:
			subroutines = indent(subroutines, tab) + '\n'
		return (
			f'class {self.className} {{\n' +
				varsSection +
				subroutines + '}'
			)

dataTypeKeyword = [
	'boolean',
	'int',
	'void'			# TODO valid for methods but not fields...
]

class CompilationEngine:
	# Not going to read from a file, just use the tokens
	def __init__(self, tsm: 'TokenStateMachine'):
		self.tokens = tsm.tokens
		self.index = 0

	def parseTokens(self, tsm: 'TokenStateMachine'):
		pass

	# TODO rename to curToken
	def nextToken(self):
		if self.index >= len(self.tokens):
			return None
		return self.tokens[self.index]

	def lookAhead(self):
		return self.tokens[self.index + 1]

	def assertIsKeyword(self, *keywords, increment=True):
		self.assertIsType(TokenType.Keyword)
		assert self.nextToken().text in keywords, f'{self.nextToken().text} is not in {keywords}'
		if increment:
			self.incToken()

	def checkIfKeyword(self, *keywordList):
		if self.nextToken().type != TokenType.Keyword:
			return False

		return self.getCurText() in keywordList

	def checkIfSymbol(self, symbolList):
		if self.nextToken().type != TokenType.Symbol:
			return False

		return self.getCurText() in symbolList

	def assertIsSymbol(self, symbol, increment=True):
		self.assertIsType(TokenType.Symbol)
		# assert self.nextToken().type == TokenType.Symbol, f'{self.nextToken().text} is not a Symbol'
		assert self.nextToken().text == symbol, f'{self.nextToken().text} is not the expected symbol {symbol}'
		if increment:
			self.incToken()

	def assertIsDataType(self):
		if self.isType(TokenType.Keyword):
			assert self.getCurText() in dataTypeKeyword, f'{self.getCurText()} is not a valid keyword-datatype'
		else:
			self.assertIsType(TokenType.Identifier)

	def assertIsType(self, typeArg):
		if type(typeArg) is str:
			raise Exception('Must pass TokenType, not str')
		assert self.nextToken() is not None
		assert self.isType(typeArg), f'{self.nextToken().text} is not {typeArg}'

	def isType(self, type):
		return self.nextToken().type == type

	def assertIsTypes(self, typeList):
		assert self.nextToken() is not None
		assert self.nextToken().type in typeList

	def incToken(self):
		self.index += 1

	def getCurText(self):
		return self.nextToken().text

	def compileSubroutineDefinition(self):
		subType = SubroutineType.parse(self.getCurText())
		self.incToken()
		# self.assertIsTypes(['keyword', 'identifier'])
		self.assertIsDataType()
		returnType = self.getCurText()
		self.incToken()
		self.assertIsType(TokenType.Identifier)
		subroutineName = self.getCurText()
		self.incToken()
		self.assertIsSymbol('(')
		parameters = []
		while not self.checkIfSymbol(')'):
			# Must have more parameters...
			self.assertIsDataType()
			paramType = self.getCurText()
			self.incToken()

			self.assertIsType(TokenType.Identifier)
			paramName = self.getCurText()
			parameters.append(SubroutineParameter(paramType, paramName))

			self.incToken()
			
			if not self.checkIfSymbol(')'):
				self.assertIsSymbol(',')

		# Must be if we exited the while loop
		self.assertIsSymbol(')')
		self.assertIsSymbol('{')

		localVariables = []
		while self.checkIfKeyword('var'):
			self.incToken()
			self.assertIsDataType()
			varType = self.getCurText()
			self.incToken()
			self.assertIsType(TokenType.Identifier)
			varName = self.getCurText()
			localVariables.append(LocalVariable(varType, varName))
			self.incToken()
			while self.checkIfSymbol(','):
				self.incToken()
				self.assertIsType(TokenType.Identifier)
				varName = self.getCurText()
				localVariables.append(LocalVariable(varType, varName))
				self.incToken()

			self.assertIsSymbol(';')


		statementBlock = self.compileStatements()
		# while not self.checkIfSymbol('}'):
		self.assertIsSymbol('}')

		return SubroutineDefinitionNode(subType, returnType, subroutineName, parameters, localVariables, statementBlock)

	def checkIfStatement(self):
		return self.checkIfKeyword('do', 'let', 'while', 'if', 'return')

	def compileStatements(self):
		statements = []
		while self.checkIfStatement():
			if self.checkIfKeyword('do'):
				statements.append(self.compileDoStatement())
			elif self.checkIfKeyword('let'):
				statements.append(self.compileLetStatement())
			elif self.checkIfKeyword('while'):
				statements.append(self.compileWhileStatement())
			elif self.checkIfKeyword('if'):
				statements.append(self.compileIfStatement())
			elif self.checkIfKeyword('return'):
				statements.append(self.compileReturnStatement())
			else:
				raise Exception('Unknown statement type')

		return StatementBlockNode(statements)

	def compileDoStatement(self):
		self.assertIsKeyword('do')
		subroutineCall = self.compileSubroutineCall()
		self.assertIsSymbol(';')
		return DoStatementNode(subroutineCall)

	def compileSubroutineCall(self):
		self.assertIsType(TokenType.Identifier)
		objName = self.getCurText()
		methodName = None
		self.incToken()

		if self.checkIfSymbol('.'):
			self.incToken()
			self.assertIsType(TokenType.Identifier)
			methodName = self.getCurText()
			self.incToken()

		self.assertIsSymbol('(')


		# Parse parameters
		arguments = []
		while not self.checkIfSymbol(')'):
			if arguments:
				self.assertIsSymbol(',')

			arguments.append(self.compileExpression())

		self.assertIsSymbol(')')

		return SubroutineCallExpression(objName, methodName, arguments)


	def compileLetStatement(self):
		self.assertIsKeyword('let')
		self.assertIsType(TokenType.Identifier)
		varName = self.getCurText()
		indexExpr = None
		self.incToken()

		if not self.checkIfSymbol('='):
			self.assertIsSymbol('[')
			indexExpr = self.compileExpression()
			self.assertIsSymbol(']')

		self.assertIsSymbol('=')

		rhs = self.compileExpression()

		self.assertIsSymbol(';')

		return LetStatementNode(varName, indexExpr, rhs)


	def compileWhileStatement(self):
		self.assertIsKeyword('while')
		self.assertIsSymbol('(')
		conditionExpr = self.compileExpression()
		self.assertIsSymbol(')')
		self.assertIsSymbol('{')
		statements = self.compileStatements()
		self.assertIsSymbol('}')

		return WhileStatementNode(conditionExpr, statements)

	def compileIfStatement(self):
		self.assertIsKeyword('if')
		self.assertIsSymbol('(')
		conditionExpr = self.compileExpression()
		self.assertIsSymbol(')')
		self.assertIsSymbol('{')
		positiveStatements = self.compileStatements()
		self.assertIsSymbol('}')
		negativeStatements = None
		if self.checkIfKeyword('else'):
			self.incToken()
			self.assertIsSymbol('{')
			negativeStatements = self.compileStatements()
			self.assertIsSymbol('}')

		return IfStatementNode(conditionExpr, positiveStatements, negativeStatements)


	def compileReturnStatement(self):
		self.assertIsKeyword('return')
		if self.checkIfSymbol(';'):
			self.incToken()
			return ReturnStatementNode(None)

		returnExpr = self.compileExpression()
		self.assertIsSymbol(';')
		return ReturnStatementNode(returnExpr)


	def compileExpression(self):
		term = self.compileTerm()
		if self.checkIfSymbol(binaryOperators):
			operator = self.getCurText()
			self.incToken()
			expr = self.compileExpression()
			return BinaryExpression(term, operator, expr)
		else:
			return TermExpression(term)

	def compileTerm(self):
		ret = None
		if self.isType(TokenType.IntegerConstant):
			ret = IntegerConstantTerm(int(self.getCurText()))
			self.incToken()
		elif self.isType(TokenType.StringConstant):
			ret = StringConstantTerm(self.getCurText())
			self.incToken()
		elif self.isType(TokenType.Keyword):
			self.assertIsKeyword('true', 'false', 'null', 'this', increment=False)
			ret = KeywordConstantTerm(self.getCurText())
			self.incToken()
			assert self.getCurText() != '.', 'TODO parse subroutineCall'
		elif self.isType(TokenType.Identifier):
			varName = self.getCurText()
			tokenAfter = self.lookAhead()
			if tokenAfter.text == '[':
				self.incToken()
				self.assertIsSymbol('[')		# Just in case??
				expr = self.compileExpression()
				self.assertIsSymbol(']')
				ret = ArrayIndexTerm(varName, expr)
			elif tokenAfter.text in ['.', '(']:		# both indicate a subroutine
				ret = self.compileSubroutineCall()
			else:
				ret = VarNameTerm(varName);
				self.incToken()
		elif self.checkIfSymbol(unaryOperators):
			op = self.getCurText()
			self.incToken()
			term = self.compileTerm()
			ret = UnaryOperatorTerm(op, term)
		elif self.checkIfSymbol('('):
			self.incToken()
			expr = self.compileExpression()
			self.assertIsSymbol(')')
			ret = ParentheticalTerm(expr)
		else:
			raise Exception('Unsupported term: ' + self.getCurText())

		return ret

	def compileClass(self):
		self.assertIsKeyword('class')
		self.assertIsType(TokenType.Identifier)
		className = self.getCurText()
		self.incToken()
		self.assertIsSymbol('{')

		vars = []
		while self.checkIfKeyword('static', 'field'):
			varModifier = ClassVarType.Static if self.getCurText() == 'static' else ClassVarType.Field
			self.incToken()

			# if self.isType(TokenType.Keyword):
			# 	varType = self.getCurText()
			# elif self.isType(TokenType.Identifier):
			# 	varType = self.getCurText()
			# else:
			# 	raise AssertionError("Don't like it")
			self.assertIsDataType()
			varType = self.getCurText()

			self.incToken()
			self.assertIsType(TokenType.Identifier)
			varName = self.getCurText()
			self.incToken()

			vars.append(ClassVar(varName, varModifier, varType))

			while self.checkIfSymbol(','):
				self.incToken()
				self.assertIsType(TokenType.Identifier)
				varName = self.getCurText()
				self.incToken()
				vars.append(ClassVar(varName, varModifier, varType))

			self.assertIsSymbol(';')

		subroutines = []
		# raise Exception(self.nextToken())
		while self.checkIfKeyword('function', 'method', 'constructor'):
			subroutines.append(self.compileSubroutineDefinition())
		# raise Exception('///')

		return ClassDefinitionNode(className, vars, subroutines)


	def toXml(self):
		pass



def parseAll(fileOrFolder):
	progname = fileOrFolder

	if progname.endswith('.jack'):
		isfile = True
		files = [progname]
		root = progname.rsplit('.jack', 1)[0]
	else:
		isfile = False
		# need to check that it's a directory of .jack files
		assert os.path.isdir(progname)
		root, _, files = next(os.walk(progname))
		files = [os.path.join(root, f) for f in files if f.endswith('.jack')]
		if not files:
			raise Exception(f'Directory {progname} has no .jack files!')

	# TODO put this somewhere

	# def printErrorInContext(token, content):

	ret = []
	for file in files:
		content = open(file).read() + ' '		# todo make the trailing whitespace unnecessary
		
		content = content.replace('//', commentChar)
		content1 = content
		content = re.compile(r'/\*.*?\*/', re.DOTALL).sub('', content)
		# print(content == content1)

		ce = None
		try:
			tsm = TokenStateMachine()
			tsm.read(content)
			ce = CompilationEngine(tsm)
			classNode = ce.compileClass()
		except Exception as ex:
			if ce is None:
				print('Exception encountered while tokenizing:')
			else:
				print('Exception ecnountered while parsing:')
			print(ex)
			print(' at token position:')
			if ce is None:

				print(tsm.tokens[-1])
			else:
				pos = ce.nextToken().span.start
				posDesc = f'line {pos.lineNumber}; column {pos.columnNumber}'
				print(posDesc)
				print(ce.nextToken().text)
		else:
			# print(classNode)
			ret.append(classNode)
		# # print(classNode.subroutines[0])
		# for sub in classNode.subroutines:
		# 	print(sub)
	return ret