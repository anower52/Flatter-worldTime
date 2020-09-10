import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Dhaka', flag: 'bd.png', url: 'Asia/Dhaka');
    await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime': instance.isDayTime,
   });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
