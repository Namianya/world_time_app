
import 'package:http/http.dart';
import 'dart:convert';

class WoldTime{
  String location;
  String time;
  String flag;
  String url;

  WoldTime({ this.location, this.flag, this.time, this.url});

  Future<void> getTime() async{
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String timezone = data['timezone'];
      print(datetime);
      print(offset);
      print(timezone);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse((offset))));
      // print(now);

      time = now.toString();
    }
    catch (e) {
      print('Caught error: $e');
      time = 'could not get time';
    }

  }

}

