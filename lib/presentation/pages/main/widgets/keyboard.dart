import 'package:flutter/material.dart';
import 'package:wordle/data/enums/keyboard_keys.dart';

import 'keyboard_key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: const [
              Flexible(
                  flex: 1,
                  child: KeyboardKey(
                    keyboardKey: KeyboardKeys.q,
                  )),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.w)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.e)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.r)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.t)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.y)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.u)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.i)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.o)),
              Flexible(
                  flex: 1, child: KeyboardKey(keyboardKey: KeyboardKeys.p)),
            ],
          ),
          Row(
            children: const [
              Spacer(
                flex: 5,
              ),
              Flexible(
                  flex: 10,
                  child: KeyboardKey(
                    keyboardKey: KeyboardKeys.a,
                  )),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.s)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.d)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.f)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.g)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.h)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.j)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.k)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.l)),
              Spacer(
                flex: 5,
              ),
            ],
          ),
          Row(
            children: const [
              Flexible(flex: 14, child: EnterKeyboardKey()),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.z)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.x)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.c)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.v)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.b)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.n)),
              Flexible(
                  flex: 10, child: KeyboardKey(keyboardKey: KeyboardKeys.m)),
              Flexible(flex: 14, child: BackspaceKeyboardKey()),
            ],
          ),
        ],
      ),
    );
  }
}
