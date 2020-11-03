import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/providers/ml_provider.dart';
import 'package:provider/provider.dart';

class MLScreen extends StatefulWidget {
  static const String route = 'MLScreen';
  @override
  _MLScreenState createState() => _MLScreenState();
}

class _MLScreenState extends State<MLScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MLProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Flutter ML Kit'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: provider.isLoading
                      ? CircularProgressIndicator()
                      : Text(provider.result),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            setState(() {
              provider.isLoading = true;
            });
            await provider.browseImage();
          },
        ),
      );
    });
  }
}
