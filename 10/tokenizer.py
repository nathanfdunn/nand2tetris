import sys
import os
from enum import Enum
import re
from string import digits, ascii_letters as letters, whitespace
from xml.sax.saxutils import escape
alphanumeric = digits + letters + '_'

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
	IntegerConstant = 2
	Symbol = 3
	StringConstant = 4
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

	@property
	def keyword(self):
		assert self.type == TokenType.Keyword
		return self.text

	@property
	def identifier(self):
		assert self.type == TokenType.Identifier
		return self.text
	
	@property
	def intVal(self):
		assert self.type == TokenType.IntegerConstant
		return int(self.text)

	@property
	def stringVal(self):
		assert self.type == TokenType.StringConstant
		return self.text

	


keywords = [
	'class',
	'let',
	'var',
	'while',
	'do',
	'method',
	'function',
	'constructor',
	'void',
	'return',
	'static',
	'field',
	'false',
	'true',
	'boolean',
	'int',
	'if',
	'else',
	'null',
	'this'
]



symbols = '{}()[].,;+-*/&|<>=~'

commentChar = '\x80'

class CompilationEngine:
	# Not going to read from a file, just use the tokens
	def __init__(self, tsm: 'TokenStateMachine'):
		self.tokens = tsm.tokens

	def parseTokens(self, tsm: 'TokenStateMachine'):
		pass


class TokenStateMachine:
	def __init__(self):
		self.state = TokenState.Nothing
		self.tokens = []
		self.curToken = ''

	def toXml(self):
		lines = []
		lines.append('<tokens>')
		for token in self.tokens:
			xmlTag = str(token.type).split('.')[1]
			xmlTag = xmlTag[0].lower() + xmlTag[1:]
			lines.append(f'<{xmlTag}>{escape(token.text)}</{xmlTag}>')

		lines.append('</tokens>')

		return '\n'.join(lines)


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
		elif self.state == TokenState.String:
			return Token(self.curToken.replace(commentChar, '//'), TokenType.StringConstant)
		elif self.state == TokenState.Nothing:
			return None
		elif self.state == TokenState.Comment:
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

	for file in files:
		content = open(file).read() + ' '		# todo make the trailing whitespace unnecessary
		content = content.replace('//', commentChar)
		content1 = content
		content = re.compile(r'/\*.*?\*/', re.DOTALL).sub('', content)
		# print(content == content1)
		tsm = TokenStateMachine()
		tsm.read(content)

		if True:
			outFileName = file.rsplit('.jack', 1)[0] + 'T.xml'
			outFileName = outFileName.split('/')[0] + '/output/' + outFileName.split('/')[1]
			with open(outFileName, 'w') as outFile:
				outFile.write(tsm.toXml())
		else:
			print(tsm.toXml())