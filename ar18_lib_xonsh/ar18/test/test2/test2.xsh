#! /usr/bin/env xonsh
# ar18 Script version 2021-08-01_10:28:19
# Script template version 2021-08-01_09:52:50

import os
import getpass
import sys

$AR18_LIB_XONSH = "ar18_lib_xonsh"
$RAISE_SUBPROC_ERROR = True
$XONSH_SHOW_TRACEBACK = True


@events.on_exit
def test():
  if os.getpid() == $AR18_PARENT_PROCESS:
    rm -rf @($AR18_TEMP_DIR)
  print("on_exit")


def get_user_name():
  if "AR18_USER_NAME" not in {...}:
    $AR18_USER_NAME = getpass.getuser()


def get_parent_process():
  if "AR18_PARENT_PROCESS" not in {...}:
    $AR18_PARENT_PROCESS = os.getpid()
    $AR18_TEMP_DIR = f"/tmp/xonsh/{$AR18_PARENT_PROCESS}"
    mkdir -p @($AR18_TEMP_DIR)


def script_dir():
  return os.path.abspath(os.path.dirname(__file__))


def script_path():
  return os.path.abspath(__file__)


def get_environment():
  pass


def retrieve_file(url, dest_dir):
  old_cwd = os.getcwd()
  mkdir -p @(dest_dir)
  cd @(dest_dir)
  curl -f -O @(url)
  cd @(old_cwd)
  

def import_include():
  try:
    assert ar18.script.include
  except:
    # Check if ar18_lib_xonsh is installed on the system.
    # If it cannot be found, fetch it from github.com.
    install_dir_path = f"/home/{$AR18_USER_NAME}/.config/ar18/{$AR18_LIB_XONSH}/INSTALL_DIR"
    if os.path.exists(install_dir_path):
      file_path = open(install_dir_path).read()
      if os.path.exists(file_path):
        file_path = f"{file_path}/{$AR18_LIB_XONSH}/ar18/script/include.xsh"
    else:
      file_path = f"{$AR18_TEMP_DIR}/{$AR18_LIB_XONSH}/ar18/script/include.xsh"
      mkdir -p @(os.path.dirname(file_path))
    if not os.path.exists(file_path):
      print("get from github")
      retrieve_file(
        f"https://raw.githubusercontent.com/ar18-linux/{$AR18_LIB_XONSH}/master/{$AR18_LIB_XONSH}/ar18/script/include.xsh",
        os.path.dirname(file_path)
      )
    source @(file_path)
    print(45)


get_user_name()
get_parent_process()
import_include()
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
