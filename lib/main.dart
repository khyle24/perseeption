import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'rand.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:flutter/services.dart';
import 'package:perseeption/database_helper.dart';
import 'package:url_launcher/url_launcher.dart ';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatefulWidget {
  @override
  _Homepagestate createState() => _Homepagestate();
}


_query() async {
  // get a reference to the database
  Database db = await DatabaseHelper.instance.database;
  // get single row
  List<String> columnsToSelect = [
    DatabaseHelper.columnId,
    DatabaseHelper.columnLetter,
  ];
  String whereString = '${DatabaseHelper.columnId} = ?';
  int rowId = 1;
  List<dynamic> whereArguments = [rowId];
  List<Map> result = await db.query(
      DatabaseHelper.table,
      columns: columnsToSelect,
      where: whereString,
      whereArgs: whereArguments);
  // print the results
  result.forEach((row) => print(row));
  // {_id: 1, name: Bob, age: 23}
}

class _Homepagestate extends State<HomePage> {
  int pageChanged = 1;
  int index = 1;
  var m;
  var letter;
  int temp;
  int num1 = 1,
      num2 = 0,
      num3 = 0,
      num4 = 0,
      num5 = 0,
      num6 = 0;
  List l;
  FlutterTts flutterTts = FlutterTts();


  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 2);
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
          if (index == 3) {
            letter = let(temp);

          speak("Instructions: Tap the button that corresponds to the combination of letter, it will inform you if you tap the wrong combination but proceeds if you got it right the first you need to answer is letter"+letter);

          }

          print(_query());
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
                    FlutterPhoneDirectCaller.callNumber("tel:+639566089282");

                  },
                  child: Image.asset('assets/images/telephone.png',width: 200,height: 200,fit: BoxFit.fill,),
                ),
              ],
            ),
          ),

          Container(

              padding: EdgeInsets.all(15),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      maxLength: 11,
    keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 20.0,
                          height: 2.0,
                          color: Colors.black
                      ),
                     // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cellphone Number',
                        hintText: 'Enter Number',
                      ),
                    ),
                  ),
    ButtonTheme(
    minWidth: 200.0,
    height: 60.0,
                 child: RaisedButton(

                    textColor:  Color(0xFF36a9e1),
                    color: Color(0xFF00315c),
                    child: Text('Enter Number'),
                    onPressed: (){

    },
                  )
    ) ],
              ),
          ),




          SafeArea(


            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(


                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Expanded(


                    child: new Column(


                      children: <Widget>[

                        Image.asset(
                          "assets/images/logo.png",
                          height: 400,
                        ),

                        new Text(
                          " \n Swipe right to learn Braille "
                          ,


                          style: TextStyle(fontSize: 15,fontFamily: 'gotham', letterSpacing: 2.0,
                              color: Colors.black),
                          textAlign: TextAlign.center,),

                        new Text(

                          "Swipe left for emergency \n",
                          style: TextStyle(fontSize: 15,fontFamily: 'gotham', letterSpacing: 2.0,
                              color: Colors.black),
                          textAlign: TextAlign.center,),

                        FlatButton
                          (


                          onPressed: () {
                            speak("Swipe right to learn Braille Code Swipe left for emergency");
                          },
                          child: Image.asset('assets/images/microphone.png',width: 200,height: 150,fit: BoxFit.fill,),
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
            //  color:Color(0xFFf2fff5),

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

        ],
      ),
    );
  }

}