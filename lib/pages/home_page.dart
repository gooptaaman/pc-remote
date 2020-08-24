import 'package:flutter/material.dart';
import 'package:remote_control/pages/settings.dart';
import 'package:remote_control/widgets/info_Card.dart';
import '../widgets/control_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wake_on_lan/wake_on_lan.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PC-REMOTE'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SettingsPage(),
              ),
            ),
          ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return Column(
          children: [
            Expanded(
              child: InfoCard(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRemoteButton(
                        icon: Icons.power_settings_new,
                        color: Colors.red[400],
                        onTap: () =>
                            buttonAction('Shutdown', 'Shutting down.', context),
                      ),
                      CustomRemoteButton(
                        icon: Icons.restore,
                        color: Colors.deepPurple[400],
                        onTap: () =>
                            buttonAction('Sleep', 'Sleeping.', context),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRemoteButton(
                        icon: Icons.refresh,
                        color: Colors.blue[400],
                        onTap: () =>
                            buttonAction('Restart', 'Restarting.', context),
                      ),
                      CustomRemoteButton(
                        icon: Icons.lightbulb_outline,
                        color: Colors.orange[400],
                        onTap: () =>
                            buttonAction('Wake', 'Waking Up.', context),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  void buttonAction(
      String command, String message, BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    final prefs = await SharedPreferences.getInstance();
    String ipv4 = prefs.getString('ip');
    String mac = prefs.getString('mac');
    String port = prefs.getString('port');
    if (command == 'Wake') {
      if (MACAddress.validate(mac) && IPv4Address.validate(ipv4)) {
        MACAddress macAddress = MACAddress.from(mac);
        IPv4Address ipv4Address = IPv4Address.from(ipv4);
        WakeOnLAN wol = WakeOnLAN.from(ipv4Address, macAddress, port: 1234);
        try {
          await wol.wake();
        } catch (e) {
          print(e);
        }
      }
    } else {
      //using airytech without authentication.
      String url = 'http://$ipv4:$port/?action=System.$command';
      try {
        await http.get(url);
      } catch (e) {
        print(e);
      }
    }
  }
}
