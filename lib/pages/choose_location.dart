// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:world_time/Service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(choose: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(choose: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(choose: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(choose: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(choose: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        choose: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(choose: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        choose: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': instance.location,
      'choose': instance.choose,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'flag': instance.flag,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.vecteezy.com/png/19053744-world-globe-earth-map'),
              ),
            ),
          );
        },
      ),
    );
  }
}
