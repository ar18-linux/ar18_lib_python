#! /usr/bin/env xonsh
# ar18 Script version 2021-08-02_22:46:17
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
print("xsh1")
print(script_dir())
print("username",$AR18_USER_NAME,__file__)
ar18.script.include("sudo.is_member")
ar18.script.include("sudo.ask_pass")
g=ar18.sudo.ask_pass()
print("hj",g)
exit(0)
ar18.script.include("sudo.exec_as")
res=ar18.sudo.is_member()
print("res",res)
print("foo")
with open(os.devnull, "w") as devnull:
  #sys.stdout = open(os.devnull, "w")
  #sys.stderr = open(os.devnull, "w")
  try:
    os.system("stty -echo >/dev/null 2>&1")
    password = input('Enter Password:')
    os.system("stty echo >/dev/null 2>&1")
  finally:
    pass
    #sys.stdout = sys.__stdout__
    #sys.stderr = sys.__stderr__

#os.system("stty -echo")
#password = input('Enter Password:')
#os.system("stty echo")
print("gg",password)
#ar18.sudo.ask_pass()
#ar18.sudo.exec("mkdir", "/tmp/foo45")
exit(0)

##################################SCRIPT_END###################################

#end
