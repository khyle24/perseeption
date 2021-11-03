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
  arr[23] = 'X';
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

String words(int num)
{
  var arr = new List();
  List yourList = ["dart", "hello", "sex"];
  int randomIndex = Random().nextInt(yourList.length);

  String word= yourList[randomIndex];
  var result = word.split('');
  print(result);
    return result[num];
}

String punc(int num)
{
  var arr = new List(16);
  arr[0] = "Apostrophe '";
  arr[1] = 'Asterisk *';
  arr[2] = 'Colon :';
  arr[3] = 'Comma ,';
  arr[4] = 'Exclamation point !';
  arr[5] = 'Hyphen -';
  arr[6] = 'Number sign #';
  arr[7] = 'Opening parenthesis (';
  arr[8] = 'Closing parenthesis )';
  arr[9]=   'Period .';
  arr[10] = 'Question mark ?';
  arr[11]='Semicolon ;';
  arr[12]='Done';
  return arr[num];
}


int b1(String letter)
{

  var arr = new List(7);
arr[0]=0;
if(letter=="A"||letter=="B"||letter=="C"||letter=="1"||letter=="2"||letter=="D"||letter=="3"||letter=="4"||letter=="5"
||letter=="E"||letter=="6"||letter=="7"||letter=="8"||letter=="F"||letter=="G"||letter=="H" ||letter=="K" ||letter=="L"
    ||letter=="M" ||letter=="N" ||letter=="O" ||letter=="P"||letter=="Q"||letter=="R"||letter=="U"||letter=="V"||letter=="X"
    ||letter=="Y"||letter=="Z")
  {

    arr[0]=1;
  }
  return arr[0];
}

int b2(String letter)
{

  var arr = new List(7);
  arr[1]=0;
  if(letter=="B"||letter=="2"||letter=="6"||letter=="7"||letter=="8"||letter=="9"||letter=="0"||letter=="F"||letter=="G"
      ||letter=="H" ||letter=="I" ||letter=="J" ||letter=="L" ||letter=="P" ||letter=="Q"||letter=="R"||letter=="S"||letter=="T"
      ||letter=="V"||letter=="W"||letter=="Colon :"||letter=="Comma ,"||letter=="Exclamation point !"||letter=="Opening parenthesis ("
      ||letter=="Closing parenthesis )"||letter=="Period ." ||letter=="Question mark ?" ||letter=="Semicolon ;")
  {

    arr[1]=1;

  }

  return arr[1];
}


int b3(String letter)
{

  var arr = new List(7);

    arr[2]=0;

  if(letter=="Apostrophe"||letter=="Asterisk *" ||letter=="K" ||letter=="L" ||letter=="M" ||letter=="N" ||letter=="O"
      ||letter=="P"||letter=="Q"||letter=="R"||letter=="S"||letter=="T"||letter=="U"||letter=="V"
      ||letter=="X"||letter=="Y"||letter=="Z"||letter=="Hyphen -"||letter=="Exclamation point !"||letter=="Number sign #"
      ||letter=="Opening parenthesis (" ||letter=="Closing parenthesis )"||letter=="Question mark ?" ||letter=="Semicolon ;")
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
  if(letter=="C"||letter=="D"||letter=="3"||letter=="4"||letter=="6"||letter=="7"||letter=="9"||letter=="0"||letter=="F"||letter=="G"
      ||letter=="I" ||letter=="J" ||letter=="M" ||letter=="N" ||letter=="P"||letter=="Q"||letter=="S"||letter=="T"||letter=="W"
      ||letter=="X"||letter=="Y"||letter=="Number sign #")
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
  if(letter=="D"||letter=="4"||letter=="5"||letter=="7"||letter=="8"||letter=="0"||letter=="E"||letter=="Asterisk *"||letter=="G"
      ||letter=="H" ||letter=="J" ||letter=="N" ||letter=="O"||letter=="Q"||letter=="R"||letter=="T"||letter=="W"||letter=="Y"
      ||letter=="Z"||letter=="Colon :"||letter=="Exclamation point !"||letter=="Number sign #"||letter=="Opening parenthesis ("
      ||letter=="Closing parenthesis )"||letter=="Period ." )
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

  if(letter=="U"||letter=="V"||letter=="W"||letter=="X"||letter=="Y"||letter=="Z"||letter=="Hyphen -"||letter=="Number sign #"
      ||letter=="Opening parenthesis (" ||letter=="Closing parenthesis )"||letter=="Period ." ||letter=="Question mark ?")
    {
      arr[5]=1;
    }


  return arr[5];
}

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    throw "Could not launch $url";
  }
}













