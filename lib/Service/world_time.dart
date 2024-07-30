import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location for the UI
  String flag; // Selected location late flag
  String choose; //Url api endpoint
  late String time;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.choose});

  Future<void> getData() async {
    var url = Uri.parse('http://worldtimeapi.org/api/timezone/$choose');
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    //get properties from data

    String dateTime = data['datetime'];
    String offSet = data['utc_offset'].substring(1, 3);

//set now property

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offSet)));
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

//set the time property
    time = DateFormat.jm().format(now);
  }
}
