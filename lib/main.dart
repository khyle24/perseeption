import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perseeption/rand.dart';
import 'package:perseeption/announcementmain.dart';
import 'package:perseeption/words.dart';
import 'package:perseeption/settings.dart';
import 'package:perseeption/timer.dart';
import 'package:perseeption/components/AdvanceCustomAlert.dart';
import 'package:perseeption/numbers.dart';
import 'package:perseeption/letters.dart';
import 'package:perseeption/punctuation.dart';
import 'package:perseeption/screensize.dart';
import 'rand.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:perseeption/sms_auto_sender.dart';
import 'package:telephony/telephony.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(MaterialApp
  (debugShowCheckedModeBanner: false,home: HomePage(),));

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
  String callnumber2='';
  String messages='';
  int num1 = 1,
      num2 = 0,
      num3 = 0,
      num4 = 0,
      num5 = 0,
      num6 = 0;
  List l;
  int h;

  final Telephony telephony = Telephony.instance;
  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  Stopwatch _stopwatch;
  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();

    } else {
      _stopwatch.start();
    }
    setState(() {});    // re-render the page
  }
/*
  String currentAddress='';
  Position currentposition;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }




*/
  String location ='Null, Press Button';
  String Address = 'No Internet';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }


  Future<String> getText2() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue2');
  }
  Future<String> getMes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringMes');
  }

  Future<String> getText1() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue1');
  }



  FlutterTts flutterTts = FlutterTts();
  Future<void> loadPrefs() async {
    // prefs = await SharedPreferences.getInstance();
    callnumber = await getText1();
    callnumber2 = await getText2();
    messages = await getMes();

    setState(() {
    });
  }


  Future<void> loc() async {

    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position);
    setState(() {
    });
  }

  @override
  void initState() {
    loadPrefs();
    _stopwatch = Stopwatch();
    handleStartStop();
    //_determinePosition();
    //_getCurrentLocation();
    // ourText = await getText();
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    double height = MediaQuery.of(context).size.height;
print(height);
    double yourWidth;
    if(height>700)
      {
        yourWidth = 640 * 0.80 /height;
      }
    else
      {
        yourWidth = 640 * 0.90 /height;
      }
    String number = yourWidth.toStringAsFixed(2);
    double result = double.parse(number);
    print(result);
    final PageController controller = PageController(initialPage: 1);

    Size screenSize = MediaQuery.of(context).size;
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
            flutterTts.stop();

            print(callnumber);
          });
if(index==0)
  {
    loc();
  }
          if (index == 2) {
temp=0;
letter = lett(temp);
num1 = 1;
num2 = 0;
num3 = 0;
num4 = 0;
num5 = 0;
num6 = 0;

            speak("This is the Demo Instructions: Tap the button that corresponds to the combination of letter, it will inform you if you tap the wrong combination but proceeds if you got the right answer you need to answer is letter"+letter);


Timer mytimer = Timer.periodic(Duration(seconds: 15), (timer) {
  //code to run on every 5 seconds

   //speak("You need to answer is letter"+letter);
});



          }
          if (index == 3) {
            num1 = 1;
            num2 = 0;
            num3 = 0;
            num4 = 0;
            num5 = 0;
            num6 = 0;
            temp=0;
            letter = let(temp);


             time();

          speak("Categories");

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


                  onPressed: ()async {
                    print(messages);
                    loc();
                  //  _determinePosition();
                    if(callnumber==null||callnumber2==null)
                      {

                         showDialog<String>(
                           barrierDismissible: false,
                           context: context,

                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alert'),
                            content: const Text('No Contact Number inserted. Go to the contact form.'),
                            actions: <Widget>[
                              TextButton(

                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => settingsn()),
                                  );



                                },





                    /*
                    Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PathName()),
                    (Route<dynamic> route) => false,
                    );
*/
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    else
                      {

                        FlutterPhoneDirectCaller.callNumber("tel:$callnumber");
                        telephony.sendSms(
                            to:callnumber,
                            message: messages+" "+'${Address}'
                        );


print(messages);




                      }


                  },
                  child: Image.asset('assets/images/telephone.png',width: 350,height: 350,fit: BoxFit.fill,semanticLabel: "call"),
                ),
                /*
                Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                SizedBox(height: 10,),
                Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('${Address}'),
                ElevatedButton(onPressed: () async{
                  Position position = await _getGeoLocationPosition();
                  location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                }, child: Text('Get Location'))
*/
              ],
            ),
          ),



          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                children: <Widget>[

                        Container(

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
                          MaterialPageRoute(builder: (context) => announcementmain()),);
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
                        fontSize: 35,
                        color: Color(0xFF00315c),
                        fontFamily: 'gotham',)
                      ,


                    ),),

                  Container(

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
                                    letter = lett(temp);

                                    if(letter=="Done")
                                    {
                                      int count=0;
                                      speak("Done for demo,Your Time is:"+formatTime(_stopwatch.elapsedMilliseconds) +"Swipe right to go on Categories");



                                    }


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

                                    letter = lett(temp);
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
                                speak("correct");
                                if (sum == 0) {
                                  setState(() {
                                    HapticFeedback.lightImpact();
                                    temp = temp + 1;
                                    letter = lett(temp);

                                    if(letter=="Done")
                                    {
                                      int count=0;
                                      speak("Done for demo,Your Time is:"+formatTime(_stopwatch.elapsedMilliseconds) +"Swipe right to go on Categories");


                                    }

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
                                speak("correct");
                                if (sum == 0) {
                                  setState(() {
                                    HapticFeedback.lightImpact();
                                    temp = temp + 1;
                                    letter = lett(temp);
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
                                speak("correct");
                                if (sum == 0) {
                                  setState(() {
                                    HapticFeedback.lightImpact();
                                    temp = temp + 1;
                                    speak(letter);
                                    letter = lett(temp);
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
                      '',
                      style: TextStyle(
                        fontSize: 5,
                        color: Color(0xFF00315c),
                        fontFamily: 'gotham',)
                      ,


                    ),),

                  Container(

                    width: MediaQuery.of(context).size.width*.95,
                    height: MediaQuery.of(context).size.height*.93,
                    // child: new Center(
                    child: GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      childAspectRatio: MediaQuery.of(context).size.height /(height/2.3),
                      crossAxisSpacing: .90,
                      mainAxisSpacing: 20,

                      children: <Widget>[

                        FlatButton
                          (

                          onPressed: () {
                            flutterTts.stop();
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => numbertab()),);
                          },

                          child: Image.asset( "assets/images/numb.png",height: 500,semanticLabel: "NUMBERS",),
                        ),


                        FlatButton
                          (

                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => letterstab()),);
                          },

                          child: Image.asset( "assets/images/letters.png",height: 500,semanticLabel: "letters",),
                        ),

                        FlatButton
                          (
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => punctua()),);

                          },


                          child: Image.asset( "assets/images/punct.png",height: 500,semanticLabel: "Punctuations",),
                        ),

                        FlatButton
                          (
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => word()),);
                          },


                          child: Image.asset( "assets/images/words.png",height: 500,semanticLabel: "words",),
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