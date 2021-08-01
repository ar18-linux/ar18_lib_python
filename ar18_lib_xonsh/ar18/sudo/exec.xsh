#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_11:48:14
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.exec
except:
##############################FUNCTION_START#################################

  def temp_func(*args):
    ret =!(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' @(args))
    return ret

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec = temp_func
