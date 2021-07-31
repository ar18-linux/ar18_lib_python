#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_21:26:30
# Function template version 2021-07-31_15:39:48

try:
  assert ar18.script.include
except:
##############################FUNCTION_START#################################

  file_path = os.path.abspath(script_dir() + "/../Struct.py")
  print(file_path)
  if not os.path.exists(file_path):
    old_cwd = os.getcwd()
    cd @(os.path.dirname(file_path))
    curl -f -O @(f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/Struct.py")
    cd @(old_cwd)
  sys.path.append(os.path.abspath(os.path.dirname(__file__) + "/.."))
  from Struct import Ar18
  def temp_func(item):
    print("importing")
    import os
    import sys
    script_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
    script_path = os.path.abspath(sys.argv[0])
    ar18_version_checker_module_name = "ar18_lib_xonsh"
    #https://raw.githubusercontent.com/ar18-linux/ar18_lib_xonsh/master/VERSION
    #https://raw.githubusercontent.com/ar18-linux/ar18_lib_xonsh/VERSION
    wget @(f"https://raw.githubusercontent.com/ar18-linux/{ar18_version_checker_module_name}/master/VERSION") -P /tmp
    echo @(item)

###############################FUNCTION_END##################################
  print("assigning")
  try:
    ar18
  except:
    ar18 = Ar18.Struct()
  ar18.script.include = temp_func
