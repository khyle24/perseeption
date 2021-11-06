import 'package:perseeption/announce.dart';
import 'package:http/http.dart' as http;

Future <List<Announcement>>getAnounce()async
{
  var url='https://perseeption-tromagade.herokuapp.com/api/getAnnouncement';
  http.Response response =await http.get(url);
  return announcementFromMap(response.body);
}