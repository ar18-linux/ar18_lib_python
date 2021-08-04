#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_22:56:59
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.debug
except:
##############################FUNCTION_START#################################

  def temp_func(output:str):
    print(f"\n{colorama.Back.MAGENTA}[$]{colorama.Style.RESET_ALL} {output}\n")

###############################FUNCTION_END##################################
  ar18.log.debug = temp_func
