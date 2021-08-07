#! /usr/bin/env xonsh
# ar18 Script version 2021-08-07_13:05:36
# Function template version 2021-08-03_00:24:44

try:
  assert ar18.script.uninstall
except:
##############################FUNCTION_START#################################
  def temp_func(module_name:str, user_name:str=None):
    if not user_name:
      user_name = $AR18_USER_NAME
    home_dir = f"/home/{user_name}/.config/ar18/{module_name}"
    meta_install_dir = f"{home_dir}/INSTALL_DIR"
    if os.path.isfile(meta_install_dir):
      ar18.script.include("sudo.ask_pass")
      ar18.sudo.ask_pass()
  
      ar18.script.include("sudo.exec_as")
      
      install_dir = open(f"{home_dir}/INSTALL_DIR", "r").read()
  
      service_file_path_install = f"{install_dir}/{module_name}/{module_name}.service"
      if os.path.isfile(service_file_path_install):
        ar18.sudo.exec_as(f"systemctl stop {module_name}.service")
        ar18.sudo.exec_as(f"systemctl disable {module_name}.service")
  
      autostart_path = f"{install_dir}/{module_name}/autostart.sh"
      if os.path.isfile(autostart_path):
        auto_start = f"/home/{user_name}/.config/ar18/autostarts/{module_name}.sh"
        ar18.sudo.exec_as(f"rm -f {auto_start}")
  
      ar18.sudo.exec_as(f"rm -f '/usr/bin/ar18.{module_name}'*")
      ar18.sudo.exec_as(f"rm -rf '{install_dir}/{module_name}'")
      
      ar18.script.include("script.read_targets")
      targets = ar18.script.read_targets()
      del(targets[module_name])
      
      ar18.script.include("script.store_targets")
      ar18.script.store_targets(targets)
      rm -f @(f"{home_dir}/INSTALL_DIR")
    else:
      ar18.script.include("log.warning")
      ar18.log.warning("Could not find INSTALL_DIR file.")

###############################FUNCTION_END##################################
  ar18.script.uninstall = temp_func
