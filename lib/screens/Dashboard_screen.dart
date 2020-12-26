import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/providers/phone_provider.dart';
import 'package:flutter_ml_kit/screens/ML_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = 'DashboardScreen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard Screen'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('Text Recognition'),
                    onPressed: () =>
                        Navigator.pushNamed(context, MLScreen.route),
                  ),
                  RaisedButton(
                    child: Text('Keluar'),
                    onPressed: () => provider.signOut(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
