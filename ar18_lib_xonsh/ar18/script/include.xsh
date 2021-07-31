#! /usr/bin/env xonsh

try:
  _test = ar18.script.include
except:
  file_path = os.path.abspath(script_dir() + "/../Struct.xsh")
  print(file_path)
  if not os.path.exists(file_path):
    old_cwd = os.getcwd()
    cd @(os.path.dirname(file_path))
    curl -f -O @(f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/Struct.xsh")
    cd @(old_cwd)
  source @(file_path)
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
  print("assigning")
  ar18 = Ar18.Struct()
  ar18.script = Ar18.Struct()
  ar18.script.include = temp_func
