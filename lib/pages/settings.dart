import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_control/data/data.dart';
import 'package:remote_control/widgets/input_field.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SettingsForm(),
        ],
      ),
    );
  }
}

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  final _controllerIp = TextEditingController();
  final _controllerMac = TextEditingController();
  final _controllerPort = TextEditingController();

  @override
  void dispose() {
    _controllerIp.dispose();
    _controllerMac.dispose();
    _controllerPort.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SettingsInputField(
            label: "IP",
            keyboard: TextInputType.numberWithOptions(),
            controller: _controllerIp,
          ),
          SettingsInputField(
            label: "MAC Address",
            keyboard: TextInputType.text,
            controller: _controllerMac,
          ),
          SettingsInputField(
            label: "Port",
            keyboard: TextInputType.number,
            controller: _controllerPort,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: RaisedButton(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.teal[400],
              child: Text('Save',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  List<String> settings = [
                    '${_controllerIp.text}',
                    '${_controllerMac.text}',
                    '${_controllerPort.text}',
                  ];
                  Provider.of<Data>(context, listen: false)
                      .changeSettings(settings);

                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Settings Updated!"),
                    ),
                  );
                  Timer(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
