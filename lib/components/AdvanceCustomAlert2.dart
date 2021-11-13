import 'dart:async';
import 'package:flutter/material.dart';
class AdvanceCustomAlert2 extends StatelessWidget {
  final String text;
  AdvanceCustomAlert2({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int count=0;
    return Dialog(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(

          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [

            Container(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(

                  children: [
                    Text('The Word is', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 20,),
                    RaisedButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.of(context).popUntil((_) => count++ >= 1);
                      },
                      color: Colors.redAccent,
                      child: Text('Okay', style: TextStyle(color: Colors.white,fontSize: 50),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 60,
                  child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}