#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_10:41:13
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.exec
except:
##############################FUNCTION_START#################################

  def temp_func(*args):
    command = "LD_PRELOAD= sudo -Sk -p ' '"
    for arg in args:
      arg = arg.replace('"', '\\\"')
      command = f'{command} "{arg}"'
    old_setting = $FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE
    $FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True
    echo @($AR18_SUDO_PASSWORD) | bash-source eval @(command)
    $FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = old_setting

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.exec = temp_func
