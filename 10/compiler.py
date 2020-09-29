import sys
import os
from enum import Enum
import re
from string import digits, ascii_letters as letters, whitespace
alphanumeric = digits + letters

class TokenState(Enum):
	Error = -1
	Nothing = 0
	Identifier = 1
	Integer = 2
	Symbol = 3
	String = 4
	Whitespace = 5
	Keyword = 6
	Comment = 7




class TokenType(Enum):
	Identifier = 1
	Integer = 2
	Symbol = 3
	String = 4
	Whitespace = 5			# won't actually use this...
	Keyword = 6
	Comment = 7

	# TODO

class Token:
	def __init__(self, text, type):
		self.text = text
		self.type = type

	def __repr__(self):
		return f'Token({repr(self.text)}, {repr(self.type)})'

keywords = [
	'class',
	'let',
	'var',
	'while',
	'do',
	'method',
	'function',
	'void',
	'return',
	'static',
	'field',
	'false',
	'true',
	'boolean',
	'int',
	'Array',
	'String',
	'null'
]

symbols = '()+=-~<>.{};,|&/*[]'

commentChar = '#'


class TokenStateMachine:
	def __init__(self):
		self.state = TokenState.Nothing
		self.tokens = []
		self.curToken = ''

	def addToken(self, token):
		if token is not None:
			self.tokens.append(token)
			# self.tokens.append(Token(tokenText, tokenType))

	def normalizeToken(self):
		if self.state == TokenState.Identifier:
			if self.curToken in keywords:
				return Token(self.curToken, TokenType.Keyword)
			else:
				return Token(self.curToken, TokenType.Identifier)
		elif self.state == TokenState.Nothing:
			return None

		return Token(self.curToken, TokenType(self.state.value))

	# And also reset state and stuff
	def addCurrentToken(self):
		self.addToken(self.normalizeToken())
		self.curToken = ''
		self.state = TokenState.Nothing

	def addCurrentAndStartFromChar(self, char):
		self.addCurrentToken()
		self.startFromChar(char)

	def startFromChar(self, char):
		self.assertNothing() 
		if char in symbols:
			self.curToken = char
			self.state = TokenState.Symbol
		elif char in letters:
			self.curToken = char
			self.state = TokenState.Identifier
		elif char in digits:
			self.curToken = char
			self.state = TokenState.Integer
		elif char == '"':
			self.state = TokenState.String
		elif char == commentChar:
			self.state = TokenState.Comment
		elif char in whitespace:
			pass
		else:
			raise Exception(f'idk what this is {char}')

	def assertNothing(self):
		assert self.curToken == ''
		assert self.state == TokenState.Nothing

	def appendChar(self, char):
		self.curToken += char

	# def consumeSymbol(self, char):
	# 	self.assertNothing()
	# 	self.tokens.append(Token(char, TokenType.Symbol))

	def read(self, content):
		for c in content:
			self.consumeChar(c)

	def __str__(self):
		return '\n'.join(str(token) for token in self.tokens)
		# return str(self.tokens)

	def consumeChar(self, char):
		if self.state == TokenState.String:
			if char == '"':
				self.addCurrentToken()
				# self.addCurrentAndStartFromChar(char)
			else:
				self.appendChar(char)

		elif self.state == TokenState.Integer:
			if char in digits:
				self.appendChar(char)
			else:
				self.addCurrentAndStartFromChar(char)

		elif self.state == TokenState.Identifier:
			if char in alphanumeric:
				self.appendChar(char)
			else:
				self.addCurrentAndStartFromChar(char)

		elif self.state == TokenState.Symbol:
			self.addCurrentAndStartFromChar(char)

		elif self.state == TokenState.Nothing:
			self.addCurrentAndStartFromChar(char)

		elif self.state == TokenState.Comment:
			if char == '\n':
				self.addCurrentAndStartFromChar(char)
			else:
				self.appendChar(char)



if not sys.flags.interactive:
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

	for file in files:
		# filename = 
		# print(os.path.join(root, 'output', os.path.basename(file), '.test'))
		content = open(file).read() + ' '		# todo make the trailing whitespace unnecessary
		content = content.replace('//', commentChar)
		content = re.compile(r'/\*.+\*/').sub('', content)
		# print(content)
		# print(content)
		tsm = TokenStateMachine()
		tsm.read(content)
		print(tsm)
		print(tsm.curToken)
		print(tsm.state)
		tsm.assertNothing()
