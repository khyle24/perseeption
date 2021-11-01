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
  var arr = new List(27);
  arr[0] = 'A';
  arr[1] = 'B';
  arr[2] = 'C';
  arr[3] = 'D';
  arr[4] = 'E';
  arr[5] = 'F';
  arr[6] = 'G';
  arr[7] = 'H';
  arr[8] = 'I';
  arr[9] = 'J';
  arr[10] = 'K';
  arr[11] = 'L';
  arr[12] = 'M';
  arr[13] = 'N';
  arr[14] = 'O';
  arr[15] = 'P';
  arr[16] = 'Q';
  arr[17] = 'R';
  arr[18] = 'S';
  arr[19] = 'T';
  arr[20] = 'U';
  arr[21] = 'V';
  arr[22] = 'W';
  arr[23] = 'Z';
  arr[24] = 'Y';
  arr[25] = 'Z';
  arr[26] = 'Done';


  return arr[num];
}

String number(int num)
{
  var arr = new List(11);
  arr[0] = '1';
  arr[1] = '2';
  arr[2] = '3';
  arr[3] = '4';
  arr[4] = '5';
  arr[5] = '6';
  arr[6] = '7';
  arr[7] = '8';
  arr[8] = '9';
  arr[9] = '0';
  arr[10]='Done';
  return arr[num];
}
String punc(int num)
{
  var arr = new List(16);
  arr[0] = 'Apostrophe';
  arr[1] = 'Asterisk *';
  arr[2] = 'Colon :';
  arr[3] = 'Comma ,';
  arr[4] = 'Dash _';
  arr[5] = 'Exclamation point !';
  arr[6] = 'Hyphen -';
  arr[7] = 'Number sign #';
  arr[8] = 'Opening parenthesis (';
  arr[9] = 'Closing parenthesis )';
  arr[10]='Period .';
  arr[11] = 'Question mark ?';
  arr[12] = 'Double quotation mark "';
  arr[13]='Semicolon ;';
  arr[14]='Done';
  return arr[num];
}


String words(int num)
{
  List yourList = ["first item", "second item", "third item"];
  int randomIndex = Random().nextInt(yourList.length);
  var arr = new List(11);

  arr[0] = '1';
  arr[1] = '2';
  arr[2] = '3';
  arr[3] = '4';
  arr[4] = '5';
  arr[5] = '6';
  arr[6] = '7';
  arr[7] = '8';
  arr[8] = '9';
  arr[9] = '0';
  arr[10]='Done';
  return arr[num];
}



int b1(String letter)
{

  var arr = new List(7);
arr[0]=0;
if(letter=="A"||letter=="B"||letter=="C"||letter=="1"||letter=="2"||letter=="D"||letter=="3"||letter=="4"||letter=="5"
||letter=="E"||letter=="6"||letter=="7"||letter=="8"||letter=="F"||letter=="G")
  {

    arr[0]=1;
  }
  return arr[0];
}

int b2(String letter)
{

  var arr = new List(7);
  arr[1]=0;
  if(letter=="B"||letter=="2"||letter=="6"||letter=="7"||letter=="8"||letter=="9"||letter=="0"||letter=="F"||letter=="G")
  {

    arr[1]=1;

  }

  return arr[1];
}


int b3(String letter)
{

  var arr = new List(7);

    arr[2]=0;

  if(letter=="Apostrophe"||letter=="Asterisk *")
  {

    arr[2]=1;

  }


  return arr[2];
}


int b4(String letter)
{

  int temp;
  var arr = new List(7);

  arr[3]=0;
  if(letter=="C"||letter=="D"||letter=="3"||letter=="4"||letter=="6"||letter=="7"||letter=="9"||letter=="0"||letter=="F"||letter=="G")
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
  if(letter=="D"||letter=="4"||letter=="5"||letter=="7"||letter=="8"||letter=="0"||letter=="E"||letter=="Asterisk *"||letter=="G")
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













