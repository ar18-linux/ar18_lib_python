#! /usr/bin/env xonsh
# ar18 Script version 2021-08-03_00:26:05
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.sudo.exec_as
except:
##############################FUNCTION_START#################################

  def temp_func(command, user:str="root"):
    return !(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' su -c @(command) - @(user))

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec_as = temp_func
