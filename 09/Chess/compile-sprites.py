import os.path

dedupe = True

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



rook2 = '''\
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777000777700077770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ff70007ff70007ff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ff77777ff77777ff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007ffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077ffffffffff77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007ffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007ffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007ffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007ffffffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007ffffffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007ffffffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007ffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077ffffffffffffffff77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077777777777777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'''.strip()

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

pawn2 = '''\
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077fff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000077fffff77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000077fffffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000077fffff77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007fffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000077fffffffffffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'''



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

bishop2 = '''\
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000007f700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000007f700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007fff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffff70700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffff700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffff707f70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffff7ff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077fffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000077fffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077fffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007fffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077fffffffffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

queen2 = '''\
00000000000000077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007700077ff770007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007f707ffffff707f700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007f7ffffffff7f7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000077ffffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000077ffffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000077ffffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000007ffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000077ffffffffffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

king2 = '''\
00000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077ffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000077ffff7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077ffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007ffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077fffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077fffffffffff7770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

knight2 = '''\
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000007f7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000007ff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000077777fff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007fffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777fffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000777ffffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007fffffffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007fffffffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007fffffffffffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000007ffffffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000077ffffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777ffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000007ffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007fffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000007ffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007fffffffffff700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000007ffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007fffffffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007ffffffffffffff7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077ffffffffffffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
				# else:
				# 	print(currentLetter)
				# 	exit()
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



def exportPico8(*pieces):
	def translateLine(line):
		return ''.join({
			' ': '00',
			'X': '77',
			'-': 'ff',
			'?': '55'
		}[c] for c in line)

	out = [''] * len(pieces[0].split('\n')) * 2
	for piece in pieces:
		lines = [
			translateLine(line[::2]) for line in piece.split('\n')
		]
		lines2 = []
		for line in lines:
			lines2.extend([line, line])
		out = [(existing + new).ljust(128, '0') for existing, new in zip(out, lines2)]

	print('\n'.join(out))

	# for line in piece.split('\n'):
	# 	deduped = line[::2]

	# 	pass




if False:
	exportPico8(rook) 

def compileFromPico8(string, methodName):
	def translateLine(line):
		return ''.join({
			'0': '  ',
			'7': 'XX',
			'f': '--',
			'5': '??'
		}[c] for c in line)

	list = [line[0:32] for line in string.split('\n')]
	list = [translateLine(line) for line in list]
	compile('\n'.join(list), methodName)
	# print('\n'.join(list))

# compileFromPico8(.strip(), 'drawRook')


exportPico8(rook)


# exit()

with open(path, 'w') as file:
	file.write('''
class Sprites {
		''')

compileFromPico8(pawn2, 'drawPawn')
# compile(knight, 'drawKnight')
compileFromPico8(knight2, 'drawKnight')
# compile(bishop, 'drawBishop')
compileFromPico8(bishop2, 'drawBishop')
# compile(rook, 'drawRook')
compileFromPico8(rook2, 'drawRook')
# compile(queen, 'drawQueen')
compileFromPico8(queen2, 'drawQueen')

# compile(king, 'drawKing')
compileFromPico8(king2, 'drawKing')


with open(path, 'a') as file:
	file.write('''
}
		''')