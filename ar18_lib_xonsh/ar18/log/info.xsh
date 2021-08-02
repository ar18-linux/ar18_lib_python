#! /usr/bin/env xonsh
# ar18 Script version 2021-08-03_00:12:24
# Function template version 2021-08-01_09:52:50
import os.path

try:
  assert ar18.log.info
except:
##############################FUNCTION_START#################################

  def temp_func(output:str):
    ENDC = "\033[0m"
    BLUE = "\e[44m"
    print(f"{BLUE}[i]{ENDC} {output}")

###############################FUNCTION_END##################################
  print("assigning")
  ar18.log.info = temp_func
