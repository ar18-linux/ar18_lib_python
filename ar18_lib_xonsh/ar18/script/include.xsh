#! /usr/bin/env xonsh
# ar18 Script version 2021-08-03_21:19:42
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.include
except:
##############################FUNCTION_START#################################

  file_path = os.path.abspath(script_dir() + "/../Struct.py")
  print(file_path)
  if not os.path.exists(file_path):
    retrieve_file(
      f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/Struct.py",
      os.path.dirname(file_path)
    )
  parent_dir = os.path.abspath(os.path.dirname(__file__) + "/..")
  sys.path.append(parent_dir)
  from Struct import Ar18, install_pip_package
  ar18 = Ar18.Struct()
  ar18.www.retrieve = retrieve_file
  ar18.pip.install = install_pip_package
  ar18.log.entry = ar18_log_entry
  ar18.log.exit = ar18_log_exit
  $AR18_INCLUDED = []

  def temp_func(item:str):
    if not item in $AR18_INCLUDED:
      $AR18_INCLUDED.append(item)
      module_name, function_name = item.split(".")
      file_path = f"{parent_dir}/{module_name}/{function_name}.xsh"
      if not os.path.exists(file_path):
        file_path2 = f"/home{$AR18_USER_NAME}/.config/ar18/{$AR18_LIB_XONSH}/INSTALL_DIR"
        if os.path.exists(file_path2):
          file_path2 = open(file_path2, "r").read().strip()
          file_path2 = f"{file_path2}/{$AR18_LIB_XONSH}/{$AR18_LIB_XONSH}/ar18/{module_name}/{function_name}.xsh"
          if os.path.exists(file_path2):
            file_path = file_path2
          else:
            print(f"retrieving {item}")
            ar18.www.retrieve(
              f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/{module_name}/{function_name}.xsh",
              os.path.dirname(file_path)
            )
      file_version = ""
      fpx = open(file_path)
      for idx, line in enumerate(fpx):
        if idx == 1:
          file_version = line
          break
      print(file_version)
      source @(file_path)

###############################FUNCTION_END##################################
  print("assigning")
  ar18.script.include = temp_func
