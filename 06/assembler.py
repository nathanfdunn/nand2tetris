import os

# try:
# 	progname, ext = os.path.splitext(sys.argv[0])
# 	assert ext == '.asm'
# except:
# 	exit('No program supplied!')
# progname = sys.argv[1].rstrip('.asm')

def do(progname, outdir):

	symbols = {
	    "SP": 0,
	    "LCL": 1,
	    "ARG": 2,
	    "THIS": 3,
	    "THAT": 4,
	    "SCREEN": 16384,
	    "KBD": 24576,
	    }
	symbols.update(('R' + str(i), i) for i in range(16))
	with open(outdir + '/' + progname + '.asm') as infile:
		lines = [line.strip() for line in infile if line.strip() and not line.strip().startswith('//')]

	lines = [line.split('//')[0].strip() for line in lines]

	linenumber = 0
	for line in lines[:]:
		if line.startswith('(') and line.endswith(')'):
			symbol = line.lstrip('(').rstrip(')')
			# Assume it's good
			symbols[symbol] = linenumber
			lines.remove(line)
		else:
			linenumber+=1


	variableLocation = 16

	with open(outdir + '/' + progname + '.hack', 'w') as outfile:
		for line in lines:
			if line.startswith('@'):
				command = line.lstrip('@')
				try:
					val = int(command)
				except:
					# val = symbols[command]
					if command not in symbols:
						symbols[command] = variableLocation
						variableLocation += 1

					val = symbols[command]

				outfile.write(format(val, '016b') + '\n')
					
			else:
				# Must have a C-instruction
				try:
					jump = None
					jump = line.split(';')[1]
				except:
					pass

				dest = line.split('=')[0] if '=' in line else ''

				expr = line.split('=')[1] if '=' in line else line
				expr = expr.split(';')[0] if ';' in expr else expr

				# print(line, expr, dest, jump)

				ddd = ''.join(str(int(c in dest)) for c in 'ADM')
				jjj = {
					None: '000',
					'JGT': '001',
					'JEQ': '010',
					'JGE': '011',
					'JLT': '100',
					'JNE': '101',
					'JLE': '110',
					'JMP': '111'
				}[jump]

				acccccc = {
					'0': 	'0 101010',
					'1': 	'0 111111',
					'-1': 	'0 111010',
					'D': 	'0 001100',
					'A': 	'0 110000',
					'!D':	'0 001101',
					'!A': 	'0 110001',
					'-D':	'0 001111',
					'-A':	'0 110011',
					'D+1':	'0 011111',
					'A+1':	'0 110111',
					'D-1':	'0 001110',
					'A-1':	'0 110010',
					'D+A':	'0 000010',
					'D-A':	'0 010011',
					'A-D':	'0 000111',
					'D&A':	'0 000000',
					'D|A':	'0 010101',

					'M': 	'1 110000',
					'!M': 	'1 110001',
					'-M':	'1 110011',
					'M+1':	'1 110111',
					'M-1':	'1 110010',
					'D+M':	'1 000010',
					'D-M':	'1 010011',
					'M-D':	'1 000111',
					'D&M':	'1 000000',
					'D|M':	'1 010101'
				}[expr].replace(' ', '')

				outfile.write('111' + acccccc + ddd + jjj + '\n')


for folder, _, files in os.walk('.'):
	for file in [f for f in files if f.endswith('.asm')]:
		do(file.strip('.asm'), folder)