import os.path

dedupe = False

rook = '''\
                                
      XXXX    XXXX    XXXX      
      XX--XXXX----XXXX--XX      
      XX----------------XX      
      XX????????????????XX      
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
        XX------------XX        
      XX????????????????XX      
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
        XX??----------??XX      
        XXXXXXXXXXXXXXXXXX      
                                '''


bishop = '''\
                                
                XX              
              XX--XX            
            XX------XX          
            XX------XX          
            XX------XX          
              XX--XX            
            XX------XX          
            XX------XX          
          XX----------XX        
          XX----------XX        
          XX----------XX        
          XX----------XX        
            XX------XX        
        XXXXXXXXXXXXXXXXXX      
                                '''




queen = '''\
                                
            XX  XX  XX          
          XX--XX--XX--XX        
          XX----------XX          
          XX----------XX          
          XX----------XX          
            XX------XX          
            XX------XX          
            XX------XX          
          XX----------XX        
          XX----------XX        
          XX----------XX        
          XX----------XX        
          XX----------XX      
        XXXXXXXXXXXXXXXXXX      
                                '''

king = '''\
                XX              
              XXXXXX            
                XX            
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
          XXXX------XXXX      
        XXXXXXXXXXXXXXXXXX      
                                '''




knight = '''\
                    XX          
                    XXXX
              XXXXXX----XX        
        XXXXXX----------XX          
      XX----------------XX          
      XX----------------XX          
        XXXXXX----------XX          
              XX------XX            
            XX--------XX          
            XX--------XX          
          XX----------XX        
          XX------------XX      
          XX------------XX        
          XXXX--------XXXX      
        XXXXXXXXXXXXXXXXXXXX      
                                '''

path = os.path.join(os.path.dirname(__file__), 'Sprites.jack')

def compile(piece, methodName):
	out = []
	for i, line in enumerate(piece.split('\n')):
		out.append(f'// start of line {i}')
		if dedupe:
			line = line.replace('  ', ' ').replace('XX', 'X').replace('--', '-').replace('??', '?')
		out.extend(parseLine(line, i))
		out.append('')
	body = '\n'.join(out)
	with open(path, 'a') as file:
		file.write(f'''\
	function void {methodName} (int x, int y, boolean squareColor, boolean pieceColor) {{
		{body}
		return;
	}}
''')
	# for x in out:
		# print(x)	


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
				if currentLetter == 'X':
					col = '~squareColor'
				elif currentLetter == '-':
					col = 'pieceColor'
				elif currentLetter == '?':
					col = '~pieceColor'
				# col = '~squareColor' if currentLetter == 'X' else 'pieceColor'
				ret.append(f'do Screen.setColor({col});')
				yscale = 1 if dedupe else 2
				ret.append(f'do Screen.drawLine(x + {start}, y + {yscale * y}, x + {end}, y + {y * yscale});')
				if not dedupe:
					ret.append(f'do Screen.drawLine(x + {start}, y + {yscale * y} + 1, x + {end}, y + {yscale * y} + 1);')

				# ret.append(f'''do Screen.drawLine(
				# 	x + (2 * {start}), 
				# 	y + (2 * {y}), 
				# 	x + (2 * {end}), 
				# 	y + (2 * {y})
				# );''')
				# ret.append(f'''do Screen.drawLine(
				# 	x + (2 * {start}), 
				# 	y + (2 * {y}) + 1, 
				# 	x + (2 * {end}), 
				# 	y + (2 * {y}) + 1
				# );''')
				# ret.append(f'do Screen.drawLine(x + {start}, y + {y}, x + {end}, y + {y});')
				# ret.append(f'do Screen.drawLine(x + {start}, y + {y} + 1, x + {end}, y + {y} + 1);')

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

with open(path, 'w') as file:
	file.write('''
class Sprites {
		''')

compile(pawn, 'drawPawn')
compile(knight, 'drawKnight')
compile(bishop, 'drawBishop')
compile(rook, 'drawRook')
compile(queen, 'drawQueen')
compile(king, 'drawKing')

with open(path, 'a') as file:
	file.write('''
}
		''')
# compile(test)