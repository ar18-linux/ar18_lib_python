#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_21:26:30
# Function template version 2021-07-31_15:39:48

try:
  assert ar18.sudo.is_member
except:
##############################FUNCTION_START#################################

  def temp_func(silent:int=None):
    if not silent:
      silent = 0
    ret = False
    res = $(sudo -vn e>o)
    if res.find("sudo: a password is required"):
      ret = True
    else:
      if not res.find("Sorry, user") and not silent:
        print("[ERROR]: Could not determine sudo access from: " + res)
    return ret

###############################FUNCTION_END##################################
  print("assigning")
  try:
    ar18
  except:
    ar18 = Ar18.Struct()
  ar18.sudo.is_member = temp_func
