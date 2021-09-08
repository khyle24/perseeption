import 'package:shared_preferences/shared_preferences.dart';

addStringToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('stringValue', "abc");
}
addIntToSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('intValue', 123);
}