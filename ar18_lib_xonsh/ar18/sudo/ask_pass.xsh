#! /usr/bin/env xonsh
# ar18 Script version 2021-08-03_00:26:05
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.sudo.ask_pass
except:
##############################FUNCTION_START#################################

  def temp_func(silent:int=0):
    if $AR18_USER_NAME == "root":
      raise RuntimeError("Must not be root!")
    ar18.script.include("sudo.is_member")
    if not "AR18_SUDO_PASSWORD" in ${...}:
      if not silent:
        print("Testing for sudo capabilities...")
      if ar18.sudo.is_member(silent):
        if not silent:
          print("Sudo rights have been asserted")
      else:
        raise RuntimeError(f"User [{$AR18_USER_NAME}] does not have sudo rights, aborting")
      if not silent:
        print("Enter your password: ")
      os.system("stty -echo >/dev/null 2>&1")
      sudo_passwd = input()
      os.system("stty echo >/dev/null 2>&1")
      if not silent:
        print("Testing the password with 'sudo -Sk id'")
      $RAISE_SUBPROC_ERROR = False
      if not !(echo @(sudo_passwd) | sudo -Sk -p ' ' id a>/dev/null):
        raise RuntimeError("Password is wrong (keyboard layout wrong, CAPS lock on?), or maybe your account is locked due to too many wrong password attempts. In this case, reset the counter with '#faillock --reset'")
      $RAISE_SUBPROC_ERROR = True
      $AR18_SUDO_PASSWORD = sudo_passwd

    return $AR18_SUDO_PASSWORD

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.ask_pass = temp_func
