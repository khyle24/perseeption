import 'package:flutter/material.dart';
import 'package:perseeption/constants.dart';
import 'package:perseeption/headerc.dart';
import 'dart:io';
import 'dart:convert';
import 'package:perseeption/announce.dart';
import 'package:perseeption/announce_api.dart';
import 'package:perseeption/notificationservice.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class announcementmain extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<announcementmain> {
  List data = [];
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    getAnounce();
   // getData();
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
    NotificationService().showNotification(1, "Perseeption", "New Announcement", 10);
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

Future getData()async{
    var url='https://perseeption-tromagade.herokuapp.com/api/getAnnouncement';
    http.Response response =await http.get(url);
    var data =jsonDecode(response.body);
    print(data.toString());
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       // controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

         MyHeader(
           //  image: "assets/images/pers.svg",

            offset: offset,
           ),


          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Announcements',
                  style:kTitleTextstyle)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),

              child: FutureBuilder(

                future: getAnounce(),
                builder: (context,snapshot)

                {

                  if(snapshot.hasData)
                    {

                      return ListView.builder(
                        controller: controller,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context,index)
                        {

                          Announcement anouncemen = snapshot.data[index];
                         return Padding(
                              padding: const EdgeInsets.all(7.0),

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: <Widget>[

                           PreventCard(text:
                            "${anouncemen.announcementContent}",

                              title: "${anouncemen.announcementTitle}",),
                                //Text("${anouncemen.announcementTitle}"),
                            //  Text('${anouncemen.announcementTitle}'),

                              ],
                            ),
                            );


                         // return Text('${anouncemen.announcementContent}');
                        },
                      );
                    }
                  return CircularProgressIndicator();
                },
               // crossAxisAlignment: CrossAxisAlignment.start,
                /*
                children: <Widget>[
     PreventCard(text:
                          "${anouncemen.announcementContent}",

                            title: "${anouncemen.announcementContent}",);
                  //Text(data[index]['productName']),
                  Text("Announcements", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "PAVIC will be joining for 6 consecutive Saturdays starting February 1, 2020 at the University of Sto. Tomas.",

                    title: "FREE Basic Bookkeeping Training at UST",
                  ),
                  PreventCard(
                    text:
                    "At Luxent Hotel, Timog Ave. QC. with the theme: Empowering Families Towards A More Inclusive Philippines",

                    title: "6th Parents Congress on Visual Impairment",
                  ),
                  PreventCard(
                    text:
                    "In winding down of all the events and the most awaited portion would be the awarding of medals.",

                    title: "VISTA (Visually Impaired Sports Training and Advocacy) Games",
                  ),
                  PreventCard(
                    text:
                    "Please be informed that we will have a PAVIC Gen. Assembly (Election of New Set of Officers).",

                    title: "PAVIC General Assembly (Election of new Officers)",
                  ),
                  SizedBox(height: 50),
                ],*/
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
        height: 290,
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              height: 290,
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
                height: 290,
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
                        maxLines: 16,
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
