#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_23:34:39
# Function template version 2021-07-31_15:39:48

try:
  assert ar18.sudo.exec
except:
##############################FUNCTION_START#################################

  def temp_func(*args):
    command = "LD_PRELOAD= sudo -Sk -p ' '"
    for arg in args:
      arg = arg.replace('"', '\\\"')
      command = f'{command} "{arg}"'
    echo @(AR18_SUDO_PASSWORD) | eval @(command)
    #echo "${ar18_sudo_password}" | eval "LD_PRELOAD= sudo -Sk -p ' ' ${command}"
    #echo ""

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec = temp_func
