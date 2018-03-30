#!/usr/bin/env python3
import os

sl = 55
log = os.popen( 'top -Hb -n1 -w 256' ).readlines()
users = os.popen( 'ls /home' ).readlines()
log = log[7:]
print( '-'*sl )
print( '^_^ job information ^_^' )
print( '-'*sl )
tot = 0
job_info = "%10s   %4s  %s"%( "user", "num", "program" )
print( job_info )
for u in users:
    uu = u.split()[0]
    job = []
    for l in log:
        ll = l.split()
        if uu == ll[1] and ll[7] == 'R' :
            job.append( ll[-1] )
    m = []
    if job != [] :
        n = len( job )
        tot += n
        for i in job:
            if not( i in m ):
                m.append(i)
        job_info = "%10s : %4d"%( uu, n )
        job_info = job_info + "  |"
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
job_info = "%10s : %4d"%( uu, n )
print( job_info )
all_job = "%10s : %4d"%( 'all', tot )
print( all_job )
print( '-'*sl )
print( '^o^ slurm information ^o^' )
print( '-'*sl )
log = os.popen( 'squeue -o %10i%10u%15j%12M%4t%4C' ).readlines()
for l in log:
    print( l[:-1] )
cl = 25
cow =  "*" * sl + '\n'
cow += " " * cl + " \   ^__^             \n"
cow += " " * cl + "  \  (oo)\_______     \n"
cow += " " * cl + "     (__)\       )\/\ \n"
cow += " " * cl + "         ||----w |    \n"
cow += " " * cl + "         ||     ||    \n"
print( cow )
