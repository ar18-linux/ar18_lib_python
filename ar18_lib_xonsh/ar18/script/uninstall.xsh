#! /usr/bin/env xonsh
# ar18 Script version 2021-08-02_00:03:10
# Function template version 2021-08-01_09:52:50
import os.path

try:
  assert ar18.script.uninstall
except:
##############################FUNCTION_START#################################

  def temp_func(install_dir:str, module_name:str, script_dir:str, user_name:str, deployment_target:str=""):
    ar18.script.include("sudo.ask_pass")
    ar18.sudo.ask_pass()

    ar18.script.include("sudo.exec_as")

    mkdir -p @(f"/home/{user_name}/.config/ar18/{module_name}")
    ar18.sudo.exec_as(f"chown {user_name}:{user_name} '/home/{user_name}/.config/ar18/{module_name}'")
    echo @(f"{install_dir}") > @(f"/home/{user_name}/.config/ar18/{module_name}/INSTALL_DIR")

    service_file_path_install = f"{install_dir}/{module_name}/{module_name}.service"
    if os.path.isfile(service_file_path_install):
      ar18.sudo.exec_as(f"systemctl stop {module_name}.service")
      ar18.sudo.exec_as(f"systemctl disable {module_name}.service")

    autostart_path = f"{install_dir}/{module_name}/autostart.sh"
    if os.path.isfile(autostart_path):
      auto_start = f"/home/{user_name}/.config/ar18/autostarts/{module_name}.sh"
      ar18.sudo.exec_as(f"rm -f {auto_start}")

    ar18.sudo.exec_as(f"rm -f '/usr/bin/ar18.{module_name}/'*")
    ar18.sudo.exec_as(f"rm -rf '{install_dir}/{module_name}'")

###############################FUNCTION_END##################################
  print("assigning")
  ar18.script.uninstall = temp_func
