import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + "/.."))

from Struct import *
_test = Ar18.Struct("/home/nulysses/Projects/deploy/deploy/config/base.json5")
del(_test.user_name)
print(_test)
exit(0)
_test.foo2 = 1
assert _test
_test.foo.bar = 33
if _test.foo.bar:
  print(1)
print(_test.foo.bar2)