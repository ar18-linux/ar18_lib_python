#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_22:56:59
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.fatal
except:
##############################FUNCTION_START#################################

  def temp_func(output:str):
    print(f"\n{colorama.Back.RED}{colorama.Fore.BLACK}[☠]{colorama.Style.RESET_ALL} {output}\n")
    exit(66)

###############################FUNCTION_END##################################
  ar18.log.fatal = temp_func
