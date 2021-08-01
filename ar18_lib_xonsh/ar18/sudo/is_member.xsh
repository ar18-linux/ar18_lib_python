#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_12:12:33
# Function template version 2021-08-01_09:52:50

try:
  assert ar18.sudo.is_member
except:
##############################FUNCTION_START#################################

  def temp_func(silent:int=0):
    ret = False
    res = !(sudo -vnk e>o)
    $RAISE_SUBPROC_ERROR = False
    res = str(res)
    $RAISE_SUBPROC_ERROR = True
    if res.find("sudo: a password is required") != -1:
      ret = True
    else:
      if not res.find("Sorry, user") and not silent:
        print("[ERROR]: Could not determine sudo access from: " + res)
    return ret

###############################FUNCTION_END##################################
  print("assigning")
  ar18.sudo.is_member = temp_func
