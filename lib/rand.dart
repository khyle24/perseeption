import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

String generateRandomString(int len) {
  var r = Random();
  const _chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}


String let(int num)
{
  var arr = new List(7);
  arr[0] = 'a';
  arr[1] = 'b';
  arr[2] = 'b';
  arr[3] = 'c';
  arr[4] = 'e';

  return arr[num];
}
