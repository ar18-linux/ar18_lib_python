#! /usr/bin/env xonsh
# ar18 Script version !!VERSION!!
# Script template version 2021-07-17_11:57:44

import os
import getpass

$AR18_LIB_XONSH = "ar18_lib_xonsh"




@events.on_exit
def test():
  rm -rf @(f"/tmp/xonsh/{$AR18_PARENT_PROCESS}")
  print("on_exit")


def get_user_name():
  if "AR18_USER_NAME" not in {...}:
    $AR18_USER_NAME = getpass.getuser()


def get_parent_process():
  if "AR18_PARENT_PROCESS" not in {...}:
    $AR18_PARENT_PROCESS = os.getpid()
    mkdir -p @(f"/tmp/xonsh/{$AR18_PARENT_PROCESS}")
    print($AR18_PARENT_PROCESS)


def get_environment():



def import_include():
  if not ar18.script.include:
    # Check if ar18_lib_xonsh is installed on the system.
    # If it cannot be found, fetch it from github.com.
    file_path = ""
    install_dir_path = f"/home/{$AR18_USER_NAME}/.config/ar18/{$AR18_LIB_XONSH}/INSTALL_DIR"
    if os.path.exists(install_dir_path):
      file_path = open(install_dir_path).read()
    if os.path.exists(file_path):
      file_path = f"{file_path}/{$AR18_LIB_XONSH}/ar18/include.xsh"
    if not os.path.exists(file_path):
      print("get from github")
      curl -O @(f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/script/include.xsh") a> /dev/null
    #source @(file_path)
    print(45)
  else:
    print("object exists")


get_user_name()
get_parent_process()
import_include()

"""
if not ar18_script_include:
  mkdir -p "/tmp/${ar18_parent_process}"
  old_cwd = $(${PWD})
  cd "/tmp/${ar18_parent_process}"
  curl -O https://raw.githubusercontent.com/ar18-linux/ar18_lib_bash/master/ar18_lib_bash/script/import.sh >/dev/null 2>&1 && . "/tmp/${ar18_parent_process}/import.sh"
  export ar18_script_import
  cd "${old_cwd}"

if installed:
  source @(f"{ar18_lib_install_dir}/ar18/script/include.xsh")
else:
  pass
"""
#################################SCRIPT_START##################################
exit(0)
echo @(os.path.abspath(sys.argv[0]))

script_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
script_path = os.path.abspath(sys.argv[0])
print(script_dir)
echo @(script_dir)
echo ${script_dir}

source @(f"{script_dir}/../Struct.xsh")
test()
exit(0)
d={"s":5,"h":{"g":7}}
print(d)
s = Struct(d)
print(s["h"]["g"])
print(s)
exit(0)
s.boo = "hoo"
s["67"] = "huju"
s["foo"] = {"tu":2}
exit(0)
#ar18.script.ximport("version_check")
#source @(f"{script_dir}/../script/import.xsh")

##################################SCRIPT_END###################################

#end
