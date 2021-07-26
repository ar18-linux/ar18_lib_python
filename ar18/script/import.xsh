#! /usr/bin/env xonsh

if not ar18:
  class ar18_object:
    pass
  ar18 = ar18_object()
if not hasattr(ar18, "script"):
  ar18.script = ar18_object
if not hasattr(ar18.script, "ximport"):
  print("sourcing")
  def temp_func(item):
    import os
    import sys
    script_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
    script_path = os.path.abspath(sys.argv[0])

    echo @(item)
  print("assigning")
  ar18.script.ximport = temp_func
