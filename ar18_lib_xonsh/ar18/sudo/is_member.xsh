#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_23:34:39
# Function template version 2021-07-31_15:39:48

try:
  assert ar18.sudo.is_member
except:
##############################FUNCTION_START#################################

  def temp_func(silent:int=0):
    ret = False
    res = !(sudo -vn e>o)
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