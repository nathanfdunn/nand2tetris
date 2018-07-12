import os
import sys
import uuid
from collections import namedtuple

progname = sys.argv[1]

if progname.endswith('.vm'):
	isfile = True
	files = [progname]
	root = progname.strip('.vm')
else:
	isfile = False
	# need to check that it's a directory of .vm files
	assert os.path.isdir(progname)
	root, _, files = next(os.walk(progname))
	files = [os.path.join(root, f) for f in files if f.endswith('.vm')]
	if not files:
		raise Exception(f'Directory {progname} has no .vm files!')
	
# for f in files:
	# print(os.path.basename(f))
# exit()

Command = namedtuple('Command', 'type, raw, arg')

def parseCommand(line, base):
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
	elif line.startswith('goto'):
		return Command('goto', line, line.strip('goto').strip())
	elif line.startswith('function'):
		_, name, localcount = line.split()
		# Overloading raw with the function name
		return Command('function', base + '.' + name, int(localcount))
	elif line.startswith('return'):
		return Command('return', line, None)
	elif line.startswith('call'):
		_, name, parmcount = line.split()
		# Overloading raw with the function name
		return Command('call', base + '.' + name, int(parmcount))
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

commands = []
files.sort(key=lambda x: not x.lower().endswith('sys.vm'))
print(files)
for f in files:
	base = os.path.basename(f).strip('.vm')
	with open(f) as prog:
		commands.extend(parseCommand(line.split('//')[0], base) for line in prog if parsable(line))
	
# with open(progname) as f:
	# commands = [parseCommand(line.split('//')[0]) for line in open(progname) if parsable(line)]

if isfile:
	out = open(root + '.asm', 'w')
else:
	out = open(os.path.join(root, os.path.basename(root)) + '.asm', 'w')
	
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

pushd = '''
@SP
A=M
M=D
@SP
M=M+1
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
		out.write(f'\n({cmd.arg})\n')
	elif cmd.type == 'if-goto':
		out.write(f'''
			{loadone}
			@{cmd.arg}
			D;JNE
			''')
	elif cmd.type == 'goto':
		out.write(f'''
			@{cmd.arg}
			0;JMP
			''')
	elif cmd.type == 'function':
		out.write(f'''
			({cmd.raw})
			''')
		for i in range(cmd.arg):
			# Push zero onto the stack for each local
			out.write(f'''
				@SP
				A=M
				M=0				// Initialize to zero
				{incsp}
				''')
	elif cmd.type == 'return':
		out.write('''
			@LCL
			D=M
			@R15	//FRAME
			M=D

			// write stack to arg[0]
			// set sp to arg
			@SP 		// D = value at top of stack
			A=M-1
			D=M

			@ARG 		// arg[0] = D
			A=M
			M=D

			@ARG 		// D = &arg[0]
			D=M

			@SP 		// SP = ARG+1
			M=D+1


			@R15
			AM=M-1		// FRAME - 1
			D=M

			@THAT
			M=D


			@R15
			AM=M-1		// FRAME - 2
			D=M

			@THIS
			M=D


			@R15
			AM=M-1		// FRAME - 3
			D=M

			@ARG
			M=D

			@R15
			AM=M-1		// FRAME - 4
			D=M

			@LCL
			M=D


			@R15
			AM=M-1		// FRAME - 5
			A=M

			0;JMP

			''')
	elif cmd.type == 'call':
		returnaddr = 'RET' + uuid.uuid4().hex
		out.write(f'''
			// push returnaddr
			@{returnaddr}
			D=A
			{pushd}

			// push LCL
			@LCL
			D=M
			{pushd}

			@ARG
			D=M
			{pushd}

			@THIS
			D=M
			{pushd}

			@THAT
			D=M
			{pushd}


			// LCL = SP
			@SP
			D=M
			@LCL
			M=D

			// ARG = SP-n-5
			@SP
			D=M
			@5
			D=D-A
			@{cmd.arg}
			D=D-A

			@ARG
			M=D

			@{cmd.raw}
			0;JMP

			({returnaddr})

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
