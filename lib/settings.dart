import 'package:flutter/material.dart';
import 'package:perseeption/constants.dart';
import 'package:perseeption/headers.dart';
import 'package:perseeption/components/RoundedInputField.dart';
import 'package:perseeption/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
class settingsn extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<settingsn> {
  final controller = ScrollController();
  String num1;
  String num2;
  String temp;
  String ourText;
  String ourText2;
  String message="";
  double offset = 0;
  String phone1;
  String _chosenValue;
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


  final Telephony telephony = Telephony.instance;
  SharedPreferences prefs;



  Future<void> loadPrefs() async {
    // prefs = await SharedPreferences.getInstance();
    ourText = await getText1();
    ourText2 = await getText2();
    // prefs = await SharedPreferences.getInstance();
    message= await getMes();

   // Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);

    bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    setState(() {
    });
  }




  Future<bool> saveMes(String m1) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('stringMes', m1);
  }
  Future<String> getMes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringMes');
  }


  Future<bool> saveText1(String n1) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('stringValue1', n1);
  }
  Future<String> getText1() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue1');
  }


  Future<bool> saveText2(String n2) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('stringValue2', n2);
  }
  Future<String> getText2() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('stringValue2');
  }


  @override
  void initState() {
    loadPrefs();
   //_determinePosition();
    //_getCurrentLocation();
   // ourText = await getText();
    // TODO: implement initState
    super.initState();


    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            MyHeader(
              //  image: "assets/images/pers.svg",

              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Contacts", style: kTitleTextstyle),
                  SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "1st Cellphone Number",
                    onChanged: (value1) {
                      num1=value1;
                    },

                  ),
                  RoundedInputField(
                    hintText: "2nd Cellphone Number",
                    onChanged: (value2) {
                      num2=value2;
                    },
                  ),


                  DropdownButton<String>(
                    focusColor:Colors.white,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor:Colors.black,
                    items: <String>[
                      'Im on emergency here is my location',
                      'Here is my Location',
                      'Here is my location. I have an emergency',

                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style:TextStyle(color:Colors.black),),
                      );
                    }).toList(),
                    hint:Text(
                      "Choose a Message",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),


                  RoundedButton(
                    text: "SAVE",
                    press: () async {
                      if(num1==null|| !RegExp(r'^(09|\+639)\d{9}$').hasMatch(num1)&&num2==null || !RegExp(r'^(09|\+639)\d{9}$').hasMatch(num2)||_chosenValue==null){
                        Fluttertoast.showToast(msg: 'Invalid Number');
                        setState(() {

                        });

                      }

                     else if(num1==num2)
                       {
                         Fluttertoast.showToast(msg: 'Input Different Number');
                         setState(() {
                         });
                       }
                      else {
                        Fluttertoast.showToast(msg: 'Data Saved');
                          print(await saveText1(num1));
                          ourText = await getText1();

                          print(await saveText2(num2));
                          ourText2 = await getText2();

                          print(await saveMes(_chosenValue));
                          message = await getMes();
                          setState(() {
                          });
                      }
                    },


                  ),
                  SizedBox(height: size.height * 0.01),

                  if(ourText != null&&ourText2!=null)
                     Text(
                   "1st Number:$ourText \n \n"
                     "2nd Number:$ourText2\n \n"
                          "Message Selected: \n$message",

                      style: TextStyle(fontSize: 12,fontFamily: 'gotham', letterSpacing: 1.0,
                          color: Color(0xFF00315c)),
                      textAlign: TextAlign.left,),

                ],
              ),

                ],
              ),
            )
          ],
        ),
    ),
    );

  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff008acf),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            //      Image.asset(image),
            Positioned(
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'gotham',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'gotham',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      //  child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
