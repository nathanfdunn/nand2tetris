

rook = '''\
                                
      XXXX    XXXX    XXXX      
      XX--XXXX----XXXX--XX      
      XX----------------XX      
      XXXXXXXXXXXXXXXXXXXX      
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
      XXXXXXXXXXXXXXXXXXXX      
      XX----------------XX      
      XXXXXXXXXXXXXXXXXXXX      
                                '''

pawn = '''\
                                
                                
                                
              XXXXXX            
            XX------XX          
            XX------XX          
            XX------XX          
              XX--XX            
            XX------XX          
            XX------XX          
          XX----------XX        
          XX----------XX        
          XX----------XX        
        XXXX----------XXXX      
        XXXXXXXXXXXXXXXXXX      
                                '''


test = '''\
XXXX----
'''


def compile(piece):
	out = []
	for i, line in enumerate(piece.split('\n')):
		out.append(f'// start of line {i}')
		line = line.replace('  ', ' ').replace('XX', 'X').replace('--', '-')
		out.extend(parseLine(line, i))
		out.append('')
	for x in out:
		print(x)	


def parseLine(line, y):
	ret = []
	# runs = {}
	currentLetter = None
	start = -1
	end = -1
	for c in list(line) + [None]:
		if c == currentLetter:
			end += 1
		else:
			# runs[start, end] = currentLetter
			if currentLetter not in (None, ' '):
				col = 'color' if c == 'X' else '~color'
				ret.append(f'do Screen.setColor({col});')
				ret.append(f'do Screen.drawLine(x + {start}, y + {y}, x + {end}, y + {y});')

			currentLetter = c
			start = end = end+1
	return ret
	# for dur, char in runs:
	# 	if char in (None, ' '):
	# 		continue
	# 	start, end = 
	# 	col = 'color' if char == 'X' else '~color'
	# 	ret.append(f'Screen.setColor({col})')
	# 	ret.append(f'Screen.drawLine(x + {})')
compile(rook)
# compile(test)