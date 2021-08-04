#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_07:58:18
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.get_config_dir
except:
##############################FUNCTION_START#################################

  def temp_func(script_dir:str, module_name:str):
    config_dir = f"/home/{$AR18_USER_NAME}/.config/ar18/{module_name}"
    if not os.path.isdir(config_dir):
      config_dir = f"{script_dir}/config"

    return config_dir

###############################FUNCTION_END##################################
  ar18.script.get_config_dir = temp_func
