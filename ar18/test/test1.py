#! /usr/bin/env python3
import os.path
import sys
print(os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])) + "./.."))
sys.path.append(os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])) + "./.."))
print(sys.path)

import Struct

s = Struct()