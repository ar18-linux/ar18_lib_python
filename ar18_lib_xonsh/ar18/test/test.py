import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + "/.."))

from Struct import Ar18

_test = Ar18.Struct()
print(_test is None)