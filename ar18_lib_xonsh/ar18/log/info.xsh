#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_07:58:18
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.info
except:
##############################FUNCTION_START#################################

  def temp_func(output:str):
    print(f"{colorama.Back.BLUE}[i]{colorama.Style.RESET_ALL} {output}")

###############################FUNCTION_END##################################
  ar18.log.info = temp_func
