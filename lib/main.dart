import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'rand.dart';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:flutter/services.dart';
import 'package:perseeption/database_helper.dart';
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
  FlutterTts flutterTts = FlutterTts();


  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController(initialPage: 1);
   Future speak(String tlk)async{
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(1);
      await flutterTts.speak(tlk);
    }
    return Scaffold(


      body: PageView(

      // controller: pageController,
        onPageChanged: (index)
        {
          setState(() {

            pageChanged=index;
          });
        m=generateRandomString(1);
        temp=0;
          letter=let(temp);
          print(m);

if(index==2)
  {

    letter=let(temp);
    speak(letter);
  }

          print(_query());
        },
        controller: controller,
        children: [
          Container(color: Colors.green,),

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
                        if(letter=="a") {
                          setState(() {
                            temp=temp +1;
                            HapticFeedback.lightImpact();
                            letter = let(temp);
                            speak(letter);
                          });
                        }
                        else if (letter=="b")
                          {
                            setState(() {
                              temp=temp +1;
                              HapticFeedback.lightImpact();
                              letter = let(temp);
                              speak(letter);
                            });
                          }
                        else
                          {
                            speak("It's wrong");
                          }



                      },

                      child: Image.asset( "assets/images/1.png",height: 550,semanticLabel: "1",),
                    ),

                    FlatButton
                      (

                      onPressed: () {
                        HapticFeedback.lightImpact();
                      },
                      child: Image.asset( "assets/images/4.png",height: 550,semanticLabel: "4",),
                    ),

                    FlatButton
                      (
                      onPressed: () {

                        if(letter=="b")
                        {
                          setState(() {

                            setState(() {
                              temp=temp +1;
                              HapticFeedback.lightImpact();
                              letter = let(temp);
                              speak(letter);
                            });
                          });
                        }
                        else
                        {
                          speak("It's wrong");
                        }

                      },
                      child: Image.asset( "assets/images/2.png",height: 550,semanticLabel: "2",),
                    ),

                    FlatButton
                      (
                      onPressed: () {

                        HapticFeedback.heavyImpact();
                      },
                      child: Image.asset( "assets/images/5.png",height: 550,semanticLabel: "5",),
                    ),
                    FlatButton
                      (
                      onPressed: () {
                      },
                      child: Image.asset( "assets/images/3.png",height: 550,semanticLabel: "3",),
                    ),

                    FlatButton
                      (
                      onPressed: () {
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