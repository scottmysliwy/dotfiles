#!/usr/local/bin/python3
from sys import argv
import subprocess

# check for exstion
# do somingthing with that exstion
file_name = None
prefix = "#!/usr/local/bin/python3"
language = 'python3'
stderr = None
stdout = None

##touch create file
## add exstions to header of file
## chmod +x fil

concatenate = lambda first,second: first + second

def call(command):
    stderr = None
    code = subprocess.call(command, stderr=stderr, stdout=stdout, shell=False)
    if stderr:
        print(stderr)
        exit(code)
    else:
        return stdout

def touch():
    return ['touch',file_name]

def header():
    return ['echo',prefix,'>>',file_name]
    #with open(file_name, 'w') as writer:
     #   writer.write(prefix)

def chmod():
    return ['chmod','+x', file_name]



mapper = {
        'py': 'python3',
        'make': [touch,header,chmod],
        }

if __name__ == '__main__':
    output = argv
    file_name = output[2]
    temp = mapper.get(output[1])
    [call(i()) for i in temp]
