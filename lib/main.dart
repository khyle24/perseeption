import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'package:perseeption/announcement.dart';
import 'package:perseeption/settings.dart';
import 'package:perseeption/timer.dart';
import 'package:perseeption/try.dart';
import 'rand.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatefulWidget {
  @override
  _Homepagestate createState() => _Homepagestate();
}


class _Homepagestate extends State<HomePage> {
  int pageChanged = 1;
  int index = 1;
  var m;
  var letter;
 var teamName;
  int temp;
  String callnumber='';
  int num1 = 1,
      num2 = 0,
      num3 = 0,
      num4 = 0,
      num5 = 0,
      num6 = 0;
  List l;


  FlutterTts flutterTts = FlutterTts();
  Future<void> loadPrefs() async {
    // prefs = await SharedPreferences.getInstance();
    callnumber = await getText1();
    setState(() {
    });
  }


  Future<String> getText1() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue1');
  }

  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController(initialPage: 1);
    Future speak(String tlk) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(0.9);
      await flutterTts.speak(tlk);
    }
    return Scaffold(


      body: PageView(

        // controller: pageController,
        onPageChanged: (index) {
          setState(() {
            pageChanged = index;
            loadPrefs();
            print(callnumber);
          });
          m = generateRandomString(1);
          temp = 0;
          letter = let(temp);
          print(m);
          num1 = 1;
          num2 = 0;
          num3 = 0;
          num4 = 0;
          num5 = 0;
          num6 = 0;
          if (index == 2) {

            speak("This is the Demo");
            Timer mytimer = Timer.periodic(Duration(seconds: 15), (timer) {
              //code to run on every 5 seconds
           //   letter = let(temp);
           //   speak("You need to answer is letter"+letter);
            });


          }
          if (index == 3) {
            letter = let(temp);
             time();

          speak("Instructions: Tap the button that corresponds to the combination of letter, it will inform you if you tap the wrong combination but proceeds if you got it right the first you need to answer is letter"+letter);

          }


         
        },
        controller: controller,
        children: [
          Container(

            padding: EdgeInsets.all(15),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                FlatButton
                  (


                  onPressed: () {

                    if(callnumber==null)
                      {
                         showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alert'),
                            content: const Text('No Contact Number inserted. Go to the contact form.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => settingsn()),),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    else
                      {
                        FlutterPhoneDirectCaller.callNumber("tel:$callnumber");
                      }


                  },
                  child: Image.asset('assets/images/telephone.png',width: 200,height: 200,fit: BoxFit.fill,semanticLabel: "call"),
                ),
              ],
            ),
          ),



          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(


              //  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                        Container(


    // child: new Center(
                       child: GridView.count(
                  physics: new NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.20, crossAxisSpacing: 100,
                   mainAxisSpacing: 10,

                  children: <Widget>[




                     IconButton(
                       icon:  Icon(Icons.contact_phone,size:50, color: Color(0xFF36a9e1),semanticLabel: "Contacts"),
                   onPressed: (){
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => settingsn()),);
                      },
                         ),
                    IconButton(
                      icon:  Icon(Icons.notifications_active,size:50, color: Color(0xFF36a9e1),semanticLabel: "Announcements"),
                      onPressed: (){

                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => announce()),);
                      },
                    ),


                      ],),),




                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                      Center(child:
                         Image.asset(
                          "assets/images/logo.png",
                          height: 300,
                        ),),

                        Center(
                        child:    Text(
                          " \n Swipe right to learn Braille "
                          ,


                          style: TextStyle(fontSize: 15,fontFamily: 'gotham', letterSpacing: 2.0,
                              color: Colors.black),
                          textAlign: TextAlign.center,),),

                        Center(
                          child: Text(

                          "Swipe left for emergency \n",
                          style: TextStyle(fontSize: 15,fontFamily: 'gotham', letterSpacing: 2.0,
                              color: Colors.black),
                          textAlign: TextAlign.center,),),

                        Center(child:FlatButton
                          (


                          onPressed: () {
                            speak("Swipe right to learn Braille Code Swipe left for emergency");
                          },
                          child: Image.asset('assets/images/microphone.png',width: 200,height: 200,fit: BoxFit.fill,),
                        ),),

                      ],
                    ),
                  ),
                  //  BottomNavBar()
                ],
              ),


            ),


          ),




          SafeArea(


            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Center(
                    child:  Text(
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
                            int orig=b1(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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

                          child: Image.asset( "assets/images/1.png",height: 550,semanticLabel: "1",),
                        ),


                        FlatButton
                          (

                          onPressed: () {
                            int orig=b4(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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

                          child: Image.asset( "assets/images/4.png",height: 550,semanticLabel: "4",),
                        ),

                        FlatButton
                          (
                          onPressed: () {
                            int orig=b2(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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


                          child: Image.asset( "assets/images/2.png",height: 550,semanticLabel: "2",),
                        ),

                        FlatButton
                          (
                          onPressed: () {


                            int orig=b5(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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
                          child: Image.asset( "assets/images/5.png",height: 550,semanticLabel: "5",),
                        ),
                        FlatButton
                          (
                          onPressed: () {
                            int orig=b3(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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
                          child: Image.asset( "assets/images/3.png",height: 550,semanticLabel: "3",),
                        ),

                        FlatButton
                          (
                          onPressed: () {

                            int orig=b6(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);

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
                          child: Image.asset( "assets/images/6.png",height: 550,semanticLabel: "6",),
                        ),



                      ],


                    ),





                  ),
                  //  BottomNavBar()
                ],
              ),
            ),
          ),












          SafeArea(


            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Center(
                    child:  Text(
                      '$letter',
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
                            int orig=b1(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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

                          child: Image.asset( "assets/images/1.png",height: 550,semanticLabel: "1",),
                        ),


                        FlatButton
                          (

                          onPressed: () {
                            int orig=b4(letter);
                                  print(orig);
                                    print(letter);

                                    int sum = num1 + num2 + num3 + num4 + num5 + num6;
                                    print(sum);
                                    if (sum > 0) {
                                    if (orig == 0) {
                                      speak("wrong You need to answer is letter "+letter);
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

                          child: Image.asset( "assets/images/4.png",height: 550,semanticLabel: "4",),
                        ),

                        FlatButton
                          (
                          onPressed: () {
                            int orig=b2(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                            if (orig == 0) {
                              speak("wrong You need to answer is letter "+letter);
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


                          child: Image.asset( "assets/images/2.png",height: 550,semanticLabel: "2",),
                        ),

                        FlatButton
                          (
                          onPressed: () {


                            int orig=b5(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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
                          child: Image.asset( "assets/images/5.png",height: 550,semanticLabel: "5",),
                        ),
                        FlatButton
                          (
                          onPressed: () {
                            int orig=b3(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);
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
                          child: Image.asset( "assets/images/3.png",height: 550,semanticLabel: "3",),
                        ),

                        FlatButton
                          (
                          onPressed: () {

                            int orig=b6(letter);
                            print(orig);
                            print(letter);

                            int sum = num1 + num2 + num3 + num4 + num5 + num6;
                            print(sum);
                            if (sum > 0) {
                              if (orig == 0) {
                                speak("wrong You need to answer is letter "+letter);

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
                          child: Image.asset( "assets/images/6.png",height: 550,semanticLabel: "6",),
                        ),



                      ],


                    ),





                  ),
                  //  BottomNavBar()
                ],
              ),
            ),
          ),



          SafeArea(


            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Center(
                    child:  Text(
                      '$letter',
                      style: TextStyle(
                        fontSize: 2,
                        color: Color(0xFF00315c),
                        fontFamily: 'gotham',)
                      ,


                    ),),

                  Expanded(


                    // child: new Center(
                    child: GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      childAspectRatio: 1.80,
                      crossAxisSpacing: .90,
                      mainAxisSpacing: 20,

                      children: <Widget>[

                        FlatButton
                          (

                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => numbertab()),);
                          },

                          child: Image.asset( "assets/images/1.png",height: 500,semanticLabel: "NUMBERS",),
                        ),


                        FlatButton
                          (

                          onPressed: () {

                          },

                          child: Image.asset( "assets/images/4.png",height: 500,semanticLabel: "letters",),
                        ),

                        FlatButton
                          (
                          onPressed: () {

                          },


                          child: Image.asset( "assets/images/2.png",height: 500,semanticLabel: "Punctuations",),
                        ),


                      ],


                    ),





                  ),
                  //  BottomNavBar()
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }

}