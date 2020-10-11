import sys
import os
from enum import Enum
import re
from tokenizer import TokenStateMachine, commentChar, TokenType


class ClassVarType(Enum):
	Static = 1
	Field = 2

class SubroutineType(Enum):
	Function = 1
	Method = 2

class AstNode:
	def __init__(self, children):
		self.children = children

class ClassVar:
	def __init__(self, varName, modifier, varType):
		self.varName = varName
		self.modifier = modifier
		self.varType = varType

	def __repr__(self):
		return f'ClassVar({repr(self.varName)}, {repr(self.modifier)}, {repr(self.varType)})'

class ClassNode(AstNode):
	def __init__(self, className, vars, subroutines):
		# super(children)
		self.className = className
		self.vars = vars
		self.subroutines = subroutines

class Subroutine(AstNode):
	def __init__(self, subroutineType, returnType):
		pass

dataTypeKeyword = [
	'boolean',
	'int'
]

class CompilationEngine:
	# Not going to read from a file, just use the tokens
	def __init__(self, tsm: 'TokenStateMachine'):
		self.tokens = tsm.tokens
		self.index = 0

	def parseTokens(self, tsm: 'TokenStateMachine'):
		pass

	def nextToken(self):
		if self.index >= len(self.tokens):
			return None
		return self.tokens[self.index]

	def assertIsKeyword(self, keyword, increment=True):
		self.assertIsType(TokenType.Keyword)
		assert self.nextToken().text == keyword
		if increment:
			self.incToken()

	def checkIfKeyword(self, keywordList):
		if self.nextToken().type != TokenType.Keyword:
			return False

		return self.getCurText() in keywordList

	def checkIfSymbol(self, symbolList):
		if self.nextToken().type != TokenType.Symbol:
			return False

		return self.getCurText() in symbolList

	def assertIsSymbol(self, symbol, increment=True):
		self.assertIsType(TokenType.Symbol)
		assert self.nextToken().text == symbol
		if increment:
			self.incToken()

	def assertIsType(self, type):
		assert self.nextToken() is not None
		assert self.isType(type)

	def isType(self, type):
		return self.nextToken().type == type

	def assertIsTypes(self, typeList):
		assert self.nextToken() is not None
		assert self.nextToken().type in typeList

	def incToken(self):
		self.index += 1

	def getCurText(self):
		return self.nextToken().text

	def compileClass(self):
		self.assertIsKeyword('class')
		self.assertIsType(TokenType.Identifier)
		className = self.getCurText()
		self.incToken()
		self.assertIsSymbol('{')

		vars = []
		while self.checkIfKeyword(['static', 'field']):
			varModifier = ClassVarType.Static if self.getCurText() == 'static' else ClassVarType.Field
			self.incToken()

			if self.isType(TokenType.Keyword):
				varType = self.getCurText()
			elif self.isType(TokenType.Identifier):
				varType = self.getCurText()
			else:
				raise AssertionError("Don't like it")

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

		# while self.checkIfKeyword(['function', 'method']):
		# 	pass

		return ClassNode(className, vars, [])


	def toXml(self):
		pass



if not sys.flags.interactive and __name__ == '__main__':
	progname = sys.argv[1]

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
	for file in files:
		content = open(file).read() + ' '		# todo make the trailing whitespace unnecessary
		content = content.replace('//', commentChar)
		content1 = content
		content = re.compile(r'/\*.*?\*/', re.DOTALL).sub('', content)
		# print(content == content1)
		tsm = TokenStateMachine()
		tsm.read(content)
		ce = CompilationEngine(tsm)
		classNode = ce.compileClass()
		print(classNode.vars)
