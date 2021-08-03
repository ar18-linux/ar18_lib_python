#! /usr/bin/env xonsh
# ar18 Script version 2021-08-03_22:25:43
# Function template version 2021-08-03_00:24:44
import os

try:
  assert ar18.sudo.exec_as
except:
##############################FUNCTION_START#################################

  def temp_func(command, user:str="root"):
    ret = !(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' su -c @(command) - @(user))
    # Need to check return code to make command blocking.
    code = ret.returncode
    return ret

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec_as = temp_func
