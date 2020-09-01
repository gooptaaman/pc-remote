import 'package:flutter/material.dart';
import 'package:wake_on_lan/wake_on_lan.dart';
import 'package:http/http.dart' as http;

class Work {
  void buttonAction(List<String> settingsList, String command, String message,
      BuildContext context) async {
    final String ipv4 = settingsList[0];
    final String mac = settingsList[1];
    final String port = settingsList[2];
    if (command == 'Wake') {
      if (MACAddress.validate(mac) && IPv4Address.validate(ipv4)) {
        MACAddress macAddress = MACAddress.from(mac);
        IPv4Address ipv4Address = IPv4Address.from(ipv4);
        WakeOnLAN wol = WakeOnLAN.from(ipv4Address, macAddress, port: 1234);
        try {
          await wol.wake();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        } catch (e) {
          print(e);
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('$e')));
        }
      }
    } else {
      //using airytech without authentication.
      String url = 'http://$ipv4:$port/?action=System.$command';
      try {
        await http.get(url);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
      } catch (e) {
        print(e);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }
}
