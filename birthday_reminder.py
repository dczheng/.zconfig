#!/usr/bin/env python3

import time
import sys
import sxtwl

birthday_data = open( sys.argv[1] ).readlines()
name = []
birthday1 = []
birthday2 = []
birthday3 = []

now_t1 = time.time()
now_t2 = time.localtime( time.time() )


for t in birthday_data:
    tmp = t[:-1].split( ':' )
    name.append( tmp[0] )

    tmp2 = tmp[1].split()
    birthday1.append( tmp2[0] )
    birthday2.append( tmp2[1] )

    tmp3 = tmp2[0].split( '-' )
    tmp4 = [ now_t2.tm_year, int( tmp3[1] ), int( tmp3[2] ), 0, 0, 0, 0, 0, 0 ]
    #print( time.struct_time( tmp4 ) )
    #a = time.struct_time( tmp4 )
    #b = time.mktime( a )
    #l = time.localtime( b )
    #print( l )
    #print( time.asctime( l ) )
    birthday3.append( time.mktime( time.struct_time( tmp4 )  ) )

#print( name )
#print( birthday1 )
#print( birthday2 )
print( birthday3 )

birthday = [ i-now_t1 for i in birthday3 ]
print( birthday )

x = 1e10
for i in range( len( birthday ) ):
    if  birthday[i] >= 0:
        if birthday[i] < x:
            x = birthday[i]

index = []
for i in range( len( birthday ) ):
        if birthday[i] == x:
            index.append( i )
print( index )

for i in index:
    print( name[i], birthday1[i], birthday2[i] )
