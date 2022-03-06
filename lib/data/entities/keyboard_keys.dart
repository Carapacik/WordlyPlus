enum KeyboardKeys {
  q,
  w,
  e,
  r,
  t,
  y,
  u,
  i,
  o,
  p,
  a1, //х
  b1, //ъ
  a,
  s,
  d,
  f,
  g,
  h,
  j,
  k,
  l,
  c1, //ж
  d1, //э
  enter,
  z,
  x,
  c,
  v,
  b,
  n,
  m,
  f1, //б
  g1, //ю
}

extension KeyboardKeyExtension on KeyboardKeys {
  // lang 0  - en
  // lang 1  - ru
  String? name({final int lang = 0}) {
    switch (lang) {
      case 0:
        switch (this) {
          case KeyboardKeys.q:
            return "q";
          case KeyboardKeys.w:
            return "w";
          case KeyboardKeys.e:
            return "e";
          case KeyboardKeys.r:
            return "r";
          case KeyboardKeys.t:
            return "t";
          case KeyboardKeys.y:
            return "y";
          case KeyboardKeys.u:
            return "u";
          case KeyboardKeys.i:
            return "i";
          case KeyboardKeys.o:
            return "o";
          case KeyboardKeys.p:
            return "p";
          case KeyboardKeys.a1:
          case KeyboardKeys.b1:
            return null;
          case KeyboardKeys.a:
            return "a";
          case KeyboardKeys.s:
            return "s";
          case KeyboardKeys.d:
            return "d";
          case KeyboardKeys.f:
            return "f";
          case KeyboardKeys.g:
            return "g";
          case KeyboardKeys.h:
            return "h";
          case KeyboardKeys.j:
            return "j";
          case KeyboardKeys.k:
            return "k";
          case KeyboardKeys.l:
            return "l";
          case KeyboardKeys.c1:
          case KeyboardKeys.d1:
            return null;
          case KeyboardKeys.enter:
            return "Enter";
          case KeyboardKeys.z:
            return "z";
          case KeyboardKeys.x:
            return "x";
          case KeyboardKeys.c:
            return "c";
          case KeyboardKeys.v:
            return "v";
          case KeyboardKeys.b:
            return "b";
          case KeyboardKeys.n:
            return "n";
          case KeyboardKeys.m:
            return "m";
          case KeyboardKeys.f1:
          case KeyboardKeys.g1:
            return null;
        }
      case 1:
      default:
        return null;
    }
  }
}
