import 'package:flutter/material.dart';
import 'package:remote_control/utils/constants.dart';

class InfoCard extends StatelessWidget {
  final String ip;
  final String mac;
  final String port;

  const InfoCard({this.ip, this.mac, this.port});

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
                'Unknown',
                style: kCardSubtitle.copyWith(color: Colors.red[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String spIp = prefs.getString('ipv4');
  //   String spMac = prefs.getString('mac');
  //   String spPort = prefs.getString('port');
  //   final data = Data();
  //   data.updateValues(newIp: spIp, newMac: spMac, newPort: spPort);
  // }
}

// //Retrieve data from Shared Preferences.
// void getData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   setState(() {
//     if (prefs.getString('ip') != null) {
//       ip = prefs.getString('ip');
//       mac = prefs.getString('mac');
//       port = prefs.getString('port');
//     } else {
//       ip = "null";
//       mac = "null";
//       port = "null";
//     }
//   });
// }
