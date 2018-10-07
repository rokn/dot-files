#!/home/rokner/anaconda3/envs/misc/bin/python

import sys
import psutil

result = 1;

for  pid in psutil.pids():
    p = psutil.Process(pid)
    if  p.name() == 'spotify':
        result = 0
        break

sys.exit(result)
