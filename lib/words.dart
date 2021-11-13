import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'package:perseeption/provider/timer_provider.dart';
import 'package:perseeption/announcementmain.dart';
import 'package:perseeption/settings.dart';
import 'package:perseeption/components/AdvanceCustomAlert.dart';
import 'package:perseeption/components/AdvanceCustomAlert2.dart';
import 'package:perseeption/timer.dart';
import 'rand.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class word extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<word> {
  int pageChanged = 1;
  int temp;
  var m;
  var numi;
  int num1 = 0,
      num2 = 0,
      num3 = 0,
      num4 = 0,
      num5 = 0,
      num6 = 0;

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  FlutterTts flutterTts = FlutterTts();
  Stopwatch _stopwatch;
  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();

    } else {
      _stopwatch.start();
    }
    setState(() {});    // re-render the page
  }
  @override
  void initState() {
    _stopwatch = Stopwatch();
    handleStartStop();

    //_determinePosition();
    //_getCurrentLocation();
    // ourText = await getText();
    // TODO: implement initState
    super.initState();


  }
  @override
  void dispose() {
    // flutterTts.stop();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final PageController controller = PageController(initialPage: 1);

    Future speak(String tlk) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(0.9);
      await flutterTts.speak(tlk);
    }


    Size size = MediaQuery.of(context).size;

    return Scaffold(


      body: PageView(

          onPageChanged: (index) {
            setState(() {
              pageChanged = index;
              flutterTts.stop();
              //  loadPrefs();

              print(index);
              print("asd");
            });

            if (index == 0) {



              temp=0;
              numi = words(temp);
              if(numi=="M")
                {
                  num1 = 1;
                  num2 = 0;
                  num3 = 1;
                  num4 = 1;
                  num5 = 0;
                  num6 = 0;
                }
              if(numi=="G")
              {
                num1 = 1;
                num2 = 1;
                num3 = 0;
                num4 = 1;
                num5 = 1;
                num6 = 0;
              }
              if(numi=="B")
              {
                num1 = 1;
                num2 = 1;
                num3 = 0;
                num4 = 0;
                num5 = 0;
                num6 = 0;
              }

             // print("You need to answer is letter"+m);
              speak("You need to answer is letter "+numi);
              Timer mytimer = Timer.periodic(Duration(seconds: 15), (timer) {
                //code to run on every 5 seconds

                // speak("You need to answer is number"+numi);
              });



              speak("The word is "+numi);
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child:
                      AdvanceCustomAlert2(text:numi), );
                  });

            }

          },

          controller: controller,
          children: [
            SafeArea(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(

                      child: Text(
                        '$numi',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF00315c),
                          fontFamily: 'gotham',)
                        ,
                      ),),

                    Container(
                      // child: new Center(
                      width: MediaQuery.of(context).size.width*.95,
                      height: MediaQuery.of(context).size.height*.90,
                      child: GridView.count(
                        physics: new NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.height /(height+230),
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,


                        children: <Widget>[
                          FlatButton
                            (
                            onPressed: () {
                              int orig=b1(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);
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
                                      numi = words(temp);

                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                      speak(numi);
                                      print(numi+"huwew");
                                    });
                                  }
                                }
                              }
                            },

                            child: Image.asset( "assets/images/1.png",height: 550,semanticLabel: "1",),
                          ),


                          FlatButton
                            (

                            onPressed: () {
                              int orig=b4(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);
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

                                      numi = words(temp);
                                      speak(numi);
                                      if(numi=="Done")
                                      {
                                        int count=0;
                                        speak("Your Time is:"+formatTime(_stopwatch.elapsedMilliseconds));
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return WillPopScope(
                                                onWillPop: () async => false,
                                                child:
                                                AdvanceCustomAlert(text: formatTime(_stopwatch.elapsedMilliseconds)), );
                                            });

                                        /*
                                showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Results'),
                                    content:
                                    Text("Your Time is:"+formatTime(_stopwatch.elapsedMilliseconds), style: TextStyle(fontSize: 20.0)),
                                    actions: <Widget>[

                                      TextButton(
                                        onPressed: () =>

                                            Navigator.of(context).popUntil((_) => count++ >= 2),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );

*/

                                      }


                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                    });
                                  }
                                }
                              }
                            },

                            child: Image.asset( "assets/images/4.png",height: 550,semanticLabel: "4",),
                          ),

                          FlatButton
                            (
                            onPressed: () {
                              int orig=b2(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);
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

                                      numi = words(temp);
                                      speak(numi);
                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                    });
                                  }
                                }
                              }
                            },


                            child: Image.asset( "assets/images/2.png",height: 550,semanticLabel: "2",),
                          ),

                          FlatButton
                            (
                            onPressed: () {


                              int orig=b5(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);
                                }
                                else if (num5 == 0) {
                                  speak("clicked this already");
                                }
                                else {
                                  num5 = num5 - 1;
                                  sum = sum - 1;
                                  print(num5);
                                  print(sum);
                                  speak("correct");
                                  if (sum == 0) {
                                    setState(() {
                                      HapticFeedback.lightImpact();
                                      temp = temp + 1;
                                      numi = words(temp);
                                      speak(numi);
                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                    });
                                  }
                                }
                              }

                              HapticFeedback.heavyImpact();
                            },
                            child: Image.asset( "assets/images/5.png",height: 550,semanticLabel: "5",),
                          ),
                          FlatButton
                            (
                            onPressed: () {
                              int orig=b3(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);
                                }
                                else if (num3 == 0) {
                                  speak("clicked this already");
                                }
                                else {
                                  num3 = num3 - 1;
                                  sum = sum - 1;
                                  print(num1);
                                  print(sum);
                                  speak("correct");
                                  if (sum == 0) {
                                    setState(() {
                                      HapticFeedback.lightImpact();
                                      temp = temp + 1;
                                      numi = words(temp);
                                      speak(numi);
                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                    });
                                  }
                                }
                              }

                            },
                            child: Image.asset( "assets/images/3.png",height: 550,semanticLabel: "3",),
                          ),

                          FlatButton
                            (
                            onPressed: () {

                              int orig=b6(numi);
                              print(orig);
                              print(numi);

                              int sum = num1 + num2 + num3 + num4 + num5 + num6;
                              print(sum);
                              if (sum > 0) {
                                if (orig == 0) {
                                  speak("wrong You need to answer is letter "+numi);

                                }
                                else if (num6 == 0) {
                                  speak("clicked this already");
                                }
                                else {
                                  num6 = num6 - 1;
                                  sum = sum - 1;
                                  speak("correct");
                                  if (sum == 0) {
                                    setState(() {
                                      HapticFeedback.lightImpact();
                                      temp = temp + 1;
                                      speak(numi);
                                      numi = words(temp);
                                      speak(numi);
                                      num1 = b1(numi);
                                      num2 = b2(numi);
                                      num3 = b3(numi);
                                      num4 = b4(numi);
                                      num5 = b5(numi);
                                      num6 = b6(numi);
                                    });
                                  }
                                }
                              }
                            },
                            child: Image.asset( "assets/images/6.png",height: 550,semanticLabel: "6",),
                          ),



                        ],


                      ),





                    ),
                    //  BottomNavBar()
                  ],
                ),
              ),
            )    ]),);


  }
}


