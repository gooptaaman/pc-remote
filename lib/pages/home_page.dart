import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_control/utils/action.dart';
import 'package:remote_control/data/data.dart';
import 'package:remote_control/widgets/info_Card.dart';
import '../widgets/control_button.dart';

class HomePage extends StatelessWidget {
  final Work work = Work();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PC-REMOTE'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Consumer<Data>(
            builder: (context, data, child) => Column(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCard(
                    ip: data.getSettings[0],
                    mac: data.getSettings[1],
                    port: data.getSettings[2],
                  ),
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
                            onTap: () => work.buttonAction(data.getSettings,
                                'Shutdown', 'Shutting down.', context),
                          ),
                          CustomRemoteButton(
                            icon: Icons.restore,
                            color: Colors.deepPurple[400],
                            onTap: () => work.buttonAction(data.getSettings,
                                'Sleep', 'Sleeping.', context),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomRemoteButton(
                            icon: Icons.refresh,
                            color: Colors.blue[400],
                            onTap: () => work.buttonAction(data.getSettings,
                                'Restart', 'Restarting.', context),
                          ),
                          CustomRemoteButton(
                            icon: Icons.lightbulb_outline,
                            color: Colors.orange[400],
                            onTap: () => work.buttonAction(data.getSettings,
                                'Wake', 'Waking Up.', context),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
