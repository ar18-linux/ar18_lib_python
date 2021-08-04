#! /usr/bin/env xonsh
# ar18 Script version 2021-08-05_01:15:05
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.info
except:
##############################FUNCTION_START#################################

  def temp_func(*output:str):
    print(f"{colorama.Back.BLUE}[i] {log_header()}{colorama.Style.RESET_ALL}")
    l_output = []
    for out in output:
      l_output.append(str(out))
    print("\n".join(list(l_output)))
    print("\n")

###############################FUNCTION_END##################################
  ar18.log.info = temp_func
