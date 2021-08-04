#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_07:58:18
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.validate_targets
except:
##############################FUNCTION_START#################################

  def temp_func(config_dir:str, targets:list, init:bool=False):
    target_list = list(
      map(lambda x: x[:-6], list(
        filter(lambda x: x[-5:] == "json5", os.listdir(config_dir)))))
    if init:
      assert len(targets) > 0, \
        f"In init mode, at least one target must be provided. Available targets: {target_list}"
    for arg in targets:
      assert arg in target_list, f"{arg} is not a valid target, valid targets are {target_list}"

    return True

###############################FUNCTION_END##################################
  ar18.script.validate_targets = temp_func
