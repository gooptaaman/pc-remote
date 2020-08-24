import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:remote_control/constants.dart';

class InfoCard extends StatefulWidget {
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  String ip = "";
  String port = "";
  String mac = "";
  String status = "Unknown";

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      margin: EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("IP:", style: kCardTitle),
              Text("MAC:", style: kCardTitle),
              Text("Port:", style: kCardTitle),
              Text("Status:", style: kCardTitle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(ip, style: kCardSubtitle),
              Text(mac, style: kCardSubtitle),
              Text(port, style: kCardSubtitle),
              Text(
                status,
                style: kCardSubtitle.copyWith(color: Colors.red[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Retrieve data from Shared Preferences.
  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getString('ip') != null) {
        ip = prefs.getString('ip');
        mac = prefs.getString('mac');
        port = prefs.getString('port');
      } else {
        ip = "null";
        mac = "null";
        port = "null";
      }
    });
  }
}
