import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/providers/phone_provider.dart';
import 'package:flutter_ml_kit/providers/ml_provider.dart';
import 'package:flutter_ml_kit/screens/Dashboard_screen.dart';
import 'package:flutter_ml_kit/screens/ML_screen.dart';
import 'package:flutter_ml_kit/screens/OTP_screen.dart';
import 'package:flutter_ml_kit/screens/Phone_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PhoneProvider>(
          create: (_) => PhoneProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ML Flutter',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: Colors.black,
                fontFamily: 'Manrope',
              ),
        ),
        initialRoute: PhoneScreen.route,
        routes: {
          MLScreen.route: (context) => ChangeNotifierProvider<MLProvider>(
                create: (context) => MLProvider(),
                child: MLScreen(),
              ),
          PhoneScreen.route: (context) => ChangeNotifierProvider<PhoneProvider>(
                create: (context) => PhoneProvider(),
                child: PhoneScreen(),
              ),
          OTPScreen.route: (context) => ChangeNotifierProvider<PhoneProvider>(
                create: (context) => PhoneProvider(),
                child: OTPScreen(),
              ),
          DashboardScreen.route: (context) =>
              ChangeNotifierProvider<PhoneProvider>(
                create: (context) => PhoneProvider(),
                child: DashboardScreen(),
              ),
        },
      ),
    );
  }
}
