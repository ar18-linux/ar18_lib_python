#! /usr/bin/env xonsh
# ar18 Script version 2021-07-31_12:59:11
# Script template version 2021-07-31_12:32:38

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


def script_dir():
  return os.path.abspath(os.path.dirname(__file__))


def get_environment():
  pass


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
def f3():
  print("f3")
  print(script_dir())
def exec():
  print("xsh2")
  def f2():
    print(script_dir())
  print(script_dir())
  print("exit2")

  return
exec()
#ar18.script.ximport("version_check")
#source @(f"{script_dir}/../script/import.xsh")

##################################SCRIPT_END###################################

#end
