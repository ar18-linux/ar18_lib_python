#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_12:47:44
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.exec_as
except:
##############################FUNCTION_START#################################

  def temp_func(command, user:str="root"):
    return !(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' su -c @(command) - @(user))

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec_as = temp_func
