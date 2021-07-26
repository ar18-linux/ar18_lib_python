#! /usr/bin/env xonsh

import sys
import os

echo @(os.path.abspath(sys.argv[0]))

script_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
script_path = os.path.abspath(sys.argv[0])
print(script_dir)
echo @(script_dir)
echo ${script_dir}

source @(f"{script_dir}/../script/import.xsh")
exit
ar18.script.ximport("version_check")
source @(f"{script_dir}/../script/import.xsh")

