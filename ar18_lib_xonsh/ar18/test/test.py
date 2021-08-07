import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + "/.."))

from Struct import *
test1 = Ar18.Struct("/home/nulysses/Projects/deploy/deploy/config/base.json5")
g="shape" in test1.dict()
test2 = Ar18.Struct("/home/nulysses/Projects/deploy/deploy/config/test.json5")
test3 = Ar18.Struct("/home/nulysses/Projects/deploy/deploy/config/test.json5")
test4 = Ar18.Struct(test3)
test1+=test2
test1.foo=test2
test5=test1.unique()
exit(0)
_test.foo2 = 1
assert _test
_test.foo.bar = 33
if _test.foo.bar:
  print(1)
print(_test.foo.bar2)