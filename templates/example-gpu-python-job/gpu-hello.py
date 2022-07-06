"""
Python script to demonstrate python sbatch scripts
"""
import datetime
import torch

def mylog(mesg):
  now = datetime.datetime.now()
  print(f'[{now}]: {mesg}')

if __name__ == '__main__':
  import sys
  mylog('Hello, World!')
  if torch.cuda.is_available():
    N_dev = torch.cuda.device_count()
    dev   = torch.cuda.current_device()
    mylog(f'{N_dev} GPUs are available')
    mylog(f'Default device is index: {dev}')
    for k in range(N_dev):
      mylog(f'GPU index {k} name: {torch.cuda.get_device_name(k)}')
  else:
    mylog('ERROR -- no GPUs are available to this runtime')
    sys.exit(1)
