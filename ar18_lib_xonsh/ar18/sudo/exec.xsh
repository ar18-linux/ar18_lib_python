#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_11:13:17
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.exec
except:
##############################FUNCTION_START#################################

  def temp_func(*args):
    command = f"echo {$AR18_SUDO_PASSWORD} | env LD_PRELOAD= sudo -Sk -p ' '"
    for arg in args:
      arg = arg.replace('"', '\\\"')
      command = f'{command} "{arg}"'
    evalx(command)

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec = temp_func
