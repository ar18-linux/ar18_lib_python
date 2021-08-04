#! /usr/bin/env xonsh
# ar18 Script version 2021-08-04_22:56:59
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.sudo.exec_as
except:
##############################FUNCTION_START#################################
  import inspect
  ar18.script.include("log.info")
  def temp_func(command, user:str="root"):
    ar18.log.info(f"Execute as [{user}]: [{command}]")
    ret = !(echo @($AR18_SUDO_PASSWORD) | env LD_PRELOAD= sudo -Sk -p '' su -c @(command) - @(user))
    # Need to check return code to make command blocking.
    try:
      code = ret.returncode
    except Exception as exc:
      frame = inspect.stack()[1]
      ar18.log.error(f"{frame.filename}: {frame.function}():{frame.lineno}\n[{command}]\nOriginal exception: {str(exc)}")
      exit(27)
    return ret

###############################FUNCTION_END##################################
  ar18.sudo.exec_as = temp_func
