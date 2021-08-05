#! /usr/bin/env xonsh
# ar18 Script version 2021-08-05_08:58:53
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.log.fatal
except:
##############################FUNCTION_START#################################

  def temp_func(*output:str):
    print(f"{colorama.Back.RED}{colorama.Fore.BLACK}[☠] {log_header()}{colorama.Style.RESET_ALL}")
    l_output = []
    for out in output:
      l_output.append(str(out))
    print("\n".join(list(l_output)) + "\n")
    exit(66)

###############################FUNCTION_END##################################
  ar18.log.fatal = temp_func
