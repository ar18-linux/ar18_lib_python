#! /usr/bin/env xonsh
# ar18 Script version 2021-08-07_13:05:36
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.warning
except:
##############################FUNCTION_START#################################

  def temp_func(*output:str):
    print(f"{colorama.Back.YELLOW}[i] {log_header()}{colorama.Style.RESET_ALL}")
    l_output = []
    for out in output:
      l_output.append(str(out))
    print("\n".join(list(l_output)) + "\n")

###############################FUNCTION_END##################################
  ar18.log.warning = temp_func
