#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_22:56:59
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.check
except:
##############################FUNCTION_START#################################

  ar18.script.include("log.error")
  def temp_func(condition:bool, output:str, code:int=1):
    if not condition:
      ar18.log.error(output)
      exit(code)

###############################FUNCTION_END##################################
  ar18.script.check = temp_func
