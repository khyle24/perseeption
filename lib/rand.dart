import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';
String generateRandomString(int len) {
  var r = Random();
  const _chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}


String let(int num)
{
  var arr = new List(7);
  arr[0] = 'A';
  arr[1] = 'B';
  arr[2] = 'C';
  arr[3] = 'D';
  arr[4] = 'E';

  return arr[num];
}

String number(int num)
{
  var arr = new List(7);
  arr[0] = '1';
  arr[1] = '2';
  arr[2] = '3';
  arr[3] = '4';
  arr[4] = '5';
  return arr[num];
}

int b1(String letter)
{

  var arr = new List(7);
arr[0]=0;
if(letter=="A"||letter=="B"||letter=="C"||letter=="1"||letter=="2"||letter=="D")
  {

    arr[0]=1;
  }
  return arr[0];
}

int b2(String letter)
{

  var arr = new List(7);
  arr[1]=0;
  if(letter=="B"||letter=="2")
  {

    arr[1]=1;

  }

  return arr[1];
}


int b3(String letter)
{

  int temp;
  var arr = new List(7);

    arr[2]=0;


  return arr[2];
}


int b4(String letter)
{

  int temp;
  var arr = new List(7);

  arr[3]=0;
  if(letter=="C"||letter=="D")
  {

    arr[3]=1;
  }


  return arr[3];
}

int b5(String letter)
{

  int temp;
  var arr = new List(7);

  arr[4]=0;
  if(letter=="D")
  {

    arr[4]=1;
  }


  return arr[4];
}

int b6(String letter)
{

  int temp;
  var arr = new List(7);

  arr[5]=0;


  return arr[5];
}

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    throw "Could not launch $url";
  }
}













