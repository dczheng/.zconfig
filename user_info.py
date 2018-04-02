#!/usr/bin/env python3
import os
import sys

sl = 60
log = os.popen( 'top -Hb -n1 -w 256' ).readlines()
users = os.popen( 'ls /home' ).readlines()
log = log[7:]
print( '-'*sl )
print( '^_^ job information ^_^' )
print( '-'*sl )
tot = 0
tot_cpu = 0
tot_mem = 0
job_info = "%10s%-5s%-10s%-8s%-6s%-10s%-s"%( "user  ", "num", "cpu", \
                                         "mem(Gb)", "mcpu", "mpro", "program" )
print( job_info )
for u in users:
    uu = u[:-1]
    job = []
    cpu = 0
    mcpu = 150
    mem = 0
    for l in log:
        ll = l.split()
        if 'top' in ll[-1]:
            continue
        if uu == ll[1] and ll[7] == 'R' :
            job.append( ll[-1] )
            x = float(ll[8]);
            if ( x < mcpu ):
                mcpu = x
                mpro = ll[-1] + " "
            cpu += x
            x = ll[5]
            if ( x[-1] == 'g'):
                x = float(x[:-1]) * 1024 * 1024
            elif ( x[-1] == 'm' ):
                x = float(x[:-1]) * 1024
            else:
                x = float( x )
            mem += x / 1024 / 1024
    tot_cpu += cpu
    tot_mem += mem
    m = []
    if job != [] :
        n = len( job )
        tot += n
        for i in job:
            if not( i in m ):
                m.append(i)
                job_info = "%10s%-5d"%( uu + '  ' , n )
        job_info += "%-10.1f"%( cpu )
        job_info += "%-8.1f"%( mem )
        job_info += "%-6.1f"%( mcpu )
        job_info += "%-10s"%( mpro )
        job_info = job_info + "|"
        for i in m:
            job_info = job_info + "%s|"%(i)
        print( job_info )
uu = 'root'
job = []
for l in log:
    ll = l.split()
    if uu == ll[1] and ll[7] == 'R':
        job.append( ll[-1] )
n = len( job )
tot += n
job_info = "%10s%-5d"%( uu + '  ' , n )
print( job_info )
all_job = "%10s%-5d%-10.1f%-10.1f"%( 'all  ', tot, tot_cpu, tot_mem )
print( all_job )

log = os.popen( 'squeue -o %10i%10u%15j%12M%4t%4C' ).readlines()
tot_cpu = 0
for i in range( 1, len(log) ):
    t = log[i].split()
    tot_cpu += int( t[-1] )
print( '-'*sl )
print( '^o^ slurm information ^o^     ** used: %i left: %i **'%(tot_cpu, 256-tot_cpu) )
print( '-'*sl )
for l in log:
    print( l[:-1] )
print( "*" * sl )

user_info_path = os.path.realpath( sys.argv[0] )
user_info_dir = os.path.dirname( user_info_path )
cowsay_path = user_info_dir + '/' + 'cowsay.py'
os.system( cowsay_path )

