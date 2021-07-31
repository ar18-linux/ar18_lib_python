#! /usr/bin/env xonsh

def exec():
  if not ar18_object:
    print("creating class")
    class ar18_object:
      pass
  if not ar18:
    print("creating root")
    ar18 = Struct()
  if not "script" in ar18:
    print("creating attr")
    ar18.script = Struct()
  if not "include" in ar18.script:
    print("sourcing")
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
    ar18.script.include = temp_func
