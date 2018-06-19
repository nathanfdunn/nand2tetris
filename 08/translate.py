import sys
import uuid
from collections import namedtuple

progname = sys.argv[1]
assert progname.endswith('.vm')

Command = namedtuple('Command', 'type, raw, arg')

def parseCommand(line):
	line = line.strip()
	if line.startswith('push constant'):
		return Command('pushc', line, int(line.lstrip('push constant').strip()))
	elif line.startswith('push') or line.startswith('pop'):
		action, segment, index = line.split()
		# Overloading raw with the segment
		return Command(action, segment, int(index))
	elif line.startswith('label'):
		return Command('label', line, line.strip('label').strip())
	elif line.startswith('if-goto'):
		return Command('if-goto', line, line.strip('if-goto').strip())
	else:
		cmdtype = {
			'eq': 'cmp',
			'lt': 'cmp',
			'gt': 'cmp',

			'or': 'bool',
			'not': 'bool',
			'and': 'bool',	

			'add': 'arith',
			'sub': 'arith',
			'neg': 'arith'
		}[line]
		return Command(cmdtype, line, None)

def parsable(line):
	line = line.split('//')[0].strip()
	return bool(line)

commands = [parseCommand(line.split('//')[0]) for line in open(progname) if parsable(line)]

out = open(progname.rstrip('.vm') + '.asm', 'w')

loadone = '''
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg
'''

loadfirst2 = '''
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2
'''

incsp = '''
@SP
M=M+1
'''

pushDReg = '''
@SP
A=M
M=D
@SP
M=M+1
'''

popIntoDReg = '''
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up
'''

for cmd in commands:
	out.write(f'// {cmd}')
	if cmd.raw in ['add', 'sub', 'and', 'or']:
		op = {
			'add': '+',
			'sub': '-',
			'and': '&',
			'or': '|'
		}[cmd.raw]
		out.write(f'''
			{loadfirst2}
			M=M{op}D
			{incsp}
			''')
	elif cmd.raw in ['neg', 'not']:
		op = {
			'neg': '-',
			'not': '!'
		}[cmd.raw]
		out.write(f'''
			{loadone}
			M={op}D
			{incsp}
			''')
	elif cmd.type == 'label':
		out.write(f'({cmd.arg})')
	elif cmd.type == 'if-goto':
		out.write(f'''
			{loadone}
			@{cmd.arg}
			D;JNE
			''')
			
	else:

		if cmd.type == 'pushc':
			# Need to write to SP, then inc SP
			out.write(f'''
				@{cmd.arg}
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				''')
		elif cmd.type == 'push':
			segmentbase = {
				'this': 'THIS',
				'local': 'LCL',
				'that': 'THAT',
				'argument': 'ARG',
				'temp': '5',
				'pointer': '3',
				'static': '16'
			}[cmd.raw]

			if cmd.raw in ['temp', 'pointer', 'static']:
				# Temp always has a fixed base...
				addrcalc = 'D=A'
			else:
				addrcalc = 'D=M'

			out.write(f'''
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@{segmentbase}
				{addrcalc}
				@{cmd.arg}
				A=D+A 			// Now we have the index

				D=M 			// Save the value

				{pushDReg*0}
@SP
A=M
M=D
@SP
M=M+1

				''')

		elif cmd.type == 'pop':
			segmentbase = {
				'this': 'THIS',
				'local': 'LCL',
				'that': 'THAT',
				'argument': 'ARG',
				'temp': '5',
				'pointer': '3',
				'static': '16'
			}[cmd.raw]

			if cmd.raw in ['temp', 'pointer', 'static']:
				# Temp always has a fixed base...
				addrcalc = 'D=A'
			else:
				addrcalc = 'D=M'

			out.write(f'''
				{popIntoDReg*0}
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@{segmentbase}
				{addrcalc}
				@{cmd.arg}
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

				''')


		elif cmd.type == 'arith':
			# if cmd.raw in ('add', 'sub'):
			if cmd.raw == 'add':
				out.write(f'''
					{loadfirst2}
					M=M+D
					{incsp}
					''')
			elif cmd.raw == 'sub':
				out.write(f'''
					{loadfirst2}
					M=M-D
					{incsp}
					''')
			elif cmd.raw == 'neg':
				out.write(f'''
					{loadone}
					M=-D
					{incsp}
					''')
			else:
				raise Exception('bad arith: ' + cmd.raw)

		elif cmd.type == 'cmp':
			jmptype = {
				'eq': 'JEQ',
				'gt': 'JGT',
				'lt': 'JLT'
			}[cmd.raw]
			jmpaddr = 'ADDR' + uuid.uuid4().hex
			out.write(f'''
				{loadfirst2}
				D=M-D		// Comparison

				M=-1		// Set to true
				@{jmpaddr}	
				D;{jmptype}		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				({jmpaddr})

				{incsp}
				''')

out.close()

# # We might be running out of execut
# outfilename = progname.rstrip('.vm') + '.asm'
# f = open(outfilename)
# prog = f.read()
# f.close()
