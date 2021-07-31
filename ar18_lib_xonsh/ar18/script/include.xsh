#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_23:34:39
# Function template version 2021-07-31_15:39:48

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
  from Struct import Ar18
  ar18 = Ar18.Struct()
  ar18.www.retrieve = retrieve_file
  def temp_func(item:str):
    module_name, function_name = item.split(".")
    file_path = parent_dir + "/" + module_name + "/" + function_name + ".xsh"
    if not os.path.exists(file_path):
      ar18.www.retrieve(
        f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/{module_name}/{function_name}.xsh",
        os.path.dirname(file_path)
      )
    source @(file_path)

###############################FUNCTION_END##################################
  print("assigning")
  ar18.script.include = temp_func
