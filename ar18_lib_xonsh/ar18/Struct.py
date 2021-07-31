#! /usr/bin/env xonsh

import weakref


class Ar18:
  class Struct:
    def __init__(self, object=None, parent=None):
      self.__dict__["__count"] = 0
      if parent:
        self.__dict__["__parent"] = weakref.ref(parent)
      else:
        self.__dict__["__parent"] = None
      if isinstance(object, dict):
        for key, item in object.items():
          if isinstance(item, dict):
            self[key] = Ar18.Struct(item)
            #self.__dict__.__setitem__(key, Struct(item))
          else:
            self[key] = item
            #self.__dict__.__setitem__(key, item)
  
    def __setattr__(self, key, value):
      if not key in self.__dict__:
        print("attr", key)
        self.__dict__["__count"] = self.__dict__["__count"] + 1
      if isinstance(value, dict):
        self.__dict__[key] = Ar18.Struct(value, self)
      else:
        self.__dict__[key] = value
  
    def __setitem__(self, key, value):
      if not key in self.__dict__:
        print("item", key)
        self.__dict__["__count"] = self.__dict__["__count"] + 1
      if isinstance(value, dict):
        self.__dict__[key] = Ar18.Struct(value, self)
      else:
        self.__dict__[key] = value
  
    def __getitem__(self, item):
      """ If not found in object, look up parent chain until found or return None. """
      if item not in self.__dict__:
        if self.__dict__["__parent"]:
          return self.__dict__["__parent"]().__getitem__(item)
        else:
          return None
      else:
        return self.__dict__[item]
  
    def __getattr__(self, item):
      """ If not found in object, look up parent chain until found or return None. """
      if item not in self.__dict__:
        if self.__dict__["__parent"]:
          return self.__dict__["__parent"]().__getattr__(item)
        else:
          return None
      else:
        return self.__dict__[item]
  
    def __bool__(self):
      return self.__dict__["__count"] != 0
  
    def __delitem__(self, key):
      if key in self.__dict__:
        self.__dict__["__count"] = self.__dict__["__count"] - 1
        del self.__dict__[key]
  
    def __delattr__(self, key):
      if key in self.__dict__:
        self.__dict__["__count"] = self.__dict__["__count"] - 1
        del self.__dict__[key]
  
    def __repr__(self, indent=2):
      s_indent = " " * indent
      ret = "{\n"
      for key, item in self.__dict__.items():
        if key not in [
          "__parent",
          "__count"
        ]:
          if isinstance(item, Ar18.Struct):
            ret += s_indent + "\"" + key + "\": " + item.__repr__(indent + 2)
          else:
            ret += s_indent + "\"" + key + "\": " + item.__repr__() + "\n"
      ret += " " * (indent - 2) + "}\n"
      return ret
  
    def count(self):
      return self.__dict__["__count"]
  
    def parent(self):
      return self.__dict__["__parent"]

def test():
  d = {"f":1,"g":{"h":7}}
  s = Ar18.Struct(d)
  assert s.f == 1
  assert s["f"] == 1
  assert s.g.h == 7
  assert s["g"]["h"] == 7
  s.f = 2
  assert s.f == 2
  assert s["f"] == 2
  s["f"] = 3
  assert s.f == 3
  assert s["f"] == 3
  s.g.h = 8
  assert s.g.h == 8
  assert s["g"]["h"] == 8
  s["g"]["h"] = 9
  assert s.g.h == 9
  assert s["g"]["h"] == 9
  s.g["h"] = 10
  assert s.g.h == 10
  assert s["g"]["h"] == 10
  s["g"].h = 11
  assert s.g.h == 11
  assert s["g"]["h"] == 11
  s.k = 5
  assert s.k == 5
  s["k"] = 6
  assert s.k == 6
  s.d = {"j":"%"}
  assert s.d.j == "%"
  s["d1"] = {"j":"!"}
  assert s.d1.j == "!"
  t = s.d["non_existant_key"]
  assert not t
  s.key_present_in_parent = "mykey"
  t2 = s.d["key_present_in_parent"]
  assert t2 == "mykey"
  s["import"] = 55
  assert s["import"] == 55
  s.d1.foo = {
    "ha": "llo"
  }
  assert s.d1.foo.ha == "llo"
  try:
    hg = s.d1.foo.non_existant_key
    assert hg is None
  except KeyError:
    pass
  try:
    t = s.h.j
    raise Exception("must raise AttributeError")
  except AttributeError:
    pass
  try:
    t = s["h"]["j"]
  except TypeError:
    pass
  assert t is None
  assert s.count() == 7
  s["65"] = {"78": 90}
  assert s.count() == 8
  s["65"] = 66
  assert s.count() == 8
  del s["65"]
  assert s.count() == 7
  del s.f
  assert s.count() == 6
  s.array = [1,2]
  assert len(s.array) == 2

  print(s)
