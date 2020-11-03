import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/providers/ml_provider.dart';
import 'package:flutter_ml_kit/screens/ML_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MLProvider>(
          create: (_) => MLProvider(),
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
          initialRoute: MLScreen.route,
          routes: {
            MLScreen.route: (context) => ChangeNotifierProvider<MLProvider>(
                  create: (context) => MLProvider(),
                  child: MLScreen(),
                ),
          }),
    );
  }
}
