#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_07:58:18
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.sudo.exec_as
except:
##############################FUNCTION_START#################################

  ar18.script.include("log.info")
  def temp_func(command, user:str="root"):
    ar18.log.info(f"Execute as [{user}]: [{command}]")
    ret = !(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' su -c @(command) - @(user))
    # Need to check return code to make command blocking.
    code = ret.returncode
    return ret

###############################FUNCTION_END##################################
  ar18.sudo.exec_as = temp_func
