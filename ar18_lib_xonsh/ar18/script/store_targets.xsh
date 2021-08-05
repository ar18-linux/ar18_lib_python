#! /usr/bin/env xonsh
# ar18 Script version 2021-08-05_08:58:53
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.store_targets
except:
##############################FUNCTION_START#################################

  def temp_func(targets:Ar18.Struct, user_name:str=None):
    if not user_name:
      user_name = $AR18_USER_NAME
    file_path = f"/home/{user_name}/.config/ar18/INSTALLED_TARGETS"
    if os.path.exists(file_path):
      ar18.sudo.exec_as(f"rm -f {file_path}")
    targets.write(file_path)

    return True

###############################FUNCTION_END##################################
  ar18.script.store_targets = temp_func
