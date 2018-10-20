#!/home/rokn/miniconda3/envs/spotify/bin/python

import shlex
from subprocess import Popen, PIPE

TITLE = 'metadata title'
ARTIST = 'metadata artist'
STATUS = 'status'
PLAYING = 'playing'

def getInfo(type):
    cmd = "playerctl -p spotify " + type
    process = Popen(shlex.split(cmd), stdout=PIPE)
    (out, _) = process.communicate()
    exit_code = process.wait()
    if  exit_code==0:
        return out.decode('utf-8').strip()
    return ''

status = getInfo(STATUS).lower()
if status == PLAYING:
    output = "  "
else:
    output = "  "

output = output + getInfo(ARTIST) + ' - ' + getInfo(TITLE)

print(output)
