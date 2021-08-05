#! /usr/bin/env xonsh
# ar18 Script version 2021-08-05_08:58:53
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.purge
except:
##############################FUNCTION_START#################################

  def temp_func(module_name:str, user_name:str=None):
    if not user_name:
      user_name = $AR18_USER_NAME
    ar18.script.include("script.uninstall")
    ar18.script.uninstall(module_name, user_name)
    ar18.sudo.exec_as(f"rm -rf /home/{user_name}/.config/ar18/{module_name} -R")

###############################FUNCTION_END##################################
  ar18.script.purge = temp_func
