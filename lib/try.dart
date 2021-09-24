import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'package:perseeption/announcement.dart';
import 'package:perseeption/settings.dart';
import 'package:perseeption/timer.dart';
import 'rand.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class numbertab extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<numbertab> {

  int num1 = 1,
      num2 = 0,
      num3 = 0,
      num4 = 0,
      num5 = 0,
      num6 = 0;
  var letter;
  int temp;

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = FlutterTts();
    Future speak(String tlk) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(0.9);
      await flutterTts.speak(tlk);
    }
    Size size = MediaQuery.of(context).size;
   return Scaffold(

body: SafeArea(
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Center(
              child: Text(
                'Demo:$letter',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF00315c),
                  fontFamily: 'gotham',)
                ,


              ),),

            Expanded(


              // child: new Center(
              child: GridView.count(
                physics: new NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: .70,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,

                children: <Widget>[

                  FlatButton
                    (


                    onPressed: () {
                      int orig = b1(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num1 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num1 = num1 - 1;
                          sum = sum - 1;
                          print(num1);
                          print(sum);
                          speak("correct");
                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;
                              letter = let(temp);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                              speak(letter);
                            });
                          }
                        }
                      }
                    },

                    child: Image.asset(
                      "assets/images/1.png", height: 550, semanticLabel: "1",),
                  ),


                  FlatButton
                    (

                    onPressed: () {
                      int orig = b4(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num4 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num4 = num4 - 1;
                          sum = sum - 1;
                          print(num4);
                          print(sum);
                          speak("correct");
                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;

                              letter = let(temp);
                              speak(letter);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                            });
                          }
                        }
                      }
                    },

                    child: Image.asset(
                      "assets/images/4.png", height: 550, semanticLabel: "4",),
                  ),

                  FlatButton
                    (
                    onPressed: () {
                      int orig = b2(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num2 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num2 = num2 - 1;
                          sum = sum - 1;
                          print(num2);
                          print(sum);
                          speak("correct");
                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;

                              letter = let(temp);
                              speak(letter);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                            });
                          }
                        }
                      }
                    },


                    child: Image.asset(
                      "assets/images/2.png", height: 550, semanticLabel: "2",),
                  ),

                  FlatButton
                    (
                    onPressed: () {
                      int orig = b5(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num5 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num5 = num5 - 1;
                          sum = sum - 1;
                          print(num5);
                          print(sum);
                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;
                              letter = let(temp);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                            });
                          }
                        }
                      }

                      HapticFeedback.heavyImpact();
                    },
                    child: Image.asset(
                      "assets/images/5.png", height: 550, semanticLabel: "5",),
                  ),
                  FlatButton
                    (
                    onPressed: () {
                      int orig = b3(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num3 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num3 = num3 - 1;
                          sum = sum - 1;
                          print(num1);
                          print(sum);
                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;
                              letter = let(temp);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                            });
                          }
                        }
                      }
                    },
                    child: Image.asset(
                      "assets/images/3.png", height: 550, semanticLabel: "3",),
                  ),

                  FlatButton
                    (
                    onPressed: () {
                      int orig = b6(letter);
                      print(orig);
                      print(letter);

                      int sum = num1 + num2 + num3 + num4 + num5 + num6;
                      print(sum);
                      if (sum > 0) {
                        if (orig == 0) {
                          speak("wrong You need to answer is letter " + letter);
                        }
                        else if (num6 == 0) {
                          speak("clicked this already");
                        }
                        else {
                          num6 = num6 - 1;
                          sum = sum - 1;

                          if (sum == 0) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              temp = temp + 1;
                              speak(letter);
                              letter = let(temp);
                              num1 = b1(letter);
                              num2 = b2(letter);
                              num3 = b3(letter);
                              num4 = b4(letter);
                              num5 = b5(letter);
                              num6 = b6(letter);
                            });
                          }
                        }
                      }
                    },
                    child: Image.asset(
                      "assets/images/6.png", height: 550, semanticLabel: "6",),
                  ),


                ],


              ),


            ),
            //  BottomNavBar()
          ],
        ),
      ),
    ),);


  }
}


