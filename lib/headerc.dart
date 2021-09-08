
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),

        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF36a9e1),
              Color(0xFF00142a),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),

          ),


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child:IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.white),

                onPressed: () => Navigator.of(context).pop(),
              ),),




            Expanded(
              child: Stack(


              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);




