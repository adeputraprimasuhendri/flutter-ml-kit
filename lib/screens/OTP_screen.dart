import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/providers/phone_provider.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  static const String route = 'OTPScreen';
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(
                          text: "Enter OTP\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Check your SMS and enter OTP code to verify your number",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinInputTextFormField(
                    controller: provider.codeNumber,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.send,
                    pinLength: 6,
                    onSubmit: (_) => provider.VerfiyPhone(context),
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
