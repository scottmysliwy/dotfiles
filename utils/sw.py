!/usr/local/bin/python3
from sys import argv
import subprocess

# check for exstion
# do somingthing with that exstion
file_name = None
prefix = "#!/usr/local/bin/swift"
language = 'swift'
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

def chmod():
    return ['chmod','+x', file_name]

spm = lambda x='executable': ['swift','package','init','--type=',x]
mkdir = lambda name: ['mkdir',name]

mapper = {
        'make': [spm,mkdir],
        'make': [touch,header,chmod],
        }
def spliter(x,sep='='):
    temp = x.split(sep)
    if len(temp) > 1:
        return (*temp,)
    else:
        return (temp,None)

def arg_mapper(func, iters):
    for i in iters:
        if isinstance(tuple,i):
            func, arg = i
            if arg:

    return [func(i) for i in iters]
args = [spliter(i) for i in args]



[func(arg) if arg else func() for func,arg in args]



def main():
    pass


if __name__ == '__main__':
    args = arg_mapper(argv)
    #temp = mapper.get(command)
    #[call(command(arg)) if arg else call(command()) for command,arg in args]
