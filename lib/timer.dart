import 'dart:async';


String time() {

  Timer mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
    //code to run on every 5 seconds

    return('This line is printed first');
  });
}

