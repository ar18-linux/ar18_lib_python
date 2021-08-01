#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_10:28:19
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.ask_pass
except:
##############################FUNCTION_START#################################

  def temp_func(silent:int=0):
    if $AR18_USER_NAME == "root":
      if not silent:
        print("[ERROR]: Must not be root!")
      exit(1)
    ar18.script.include("sudo.is_member")
    if not "AR18_SUDO_PASSWORD" in ${...}:
      if not silent:
        print("Testing for sudo capabilities...")
      if ar18.sudo.is_member(silent):
        if not silent:
          print("Sudo rights have been asserted")
      else:
        if not silent:
          print(f"[ERROR]: User [{$AR18_USER_NAME}] does not have sudo rights, aborting")
          exit(1)
      if not silent:
        sudo_passwd = getpass.getpass("Enter your password: ")
      else:
        sudo_passwd = getpass.getpass("Enter your password: ")
      if not silent:
        print("Testing the password with 'sudo -Sk id'")
      $RAISE_SUBPROC_ERROR = False
      if not !(echo @(sudo_passwd) | sudo -Sk -p ' ' id a>/dev/null):
        if not silent:
          print("[ERROR]: Password is wrong (keyboard layout wrong, CAPS lock on?), or maybe your account is locked due to too many wrong password attempts. In this case, reset the counter with '#faillock --reset'")
        exit(1)
      $RAISE_SUBPROC_ERROR = True
      $AR18_SUDO_PASSWORD = sudo_passwd

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.ask_pass = temp_func
