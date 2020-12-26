import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/config/validation.dart';
import 'package:flutter_ml_kit/providers/phone_provider.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  static const String route = 'PhoneScreen';
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final _formKey = new GlobalKey<FormState>();
  FormValidation _formValidation = FormValidation();
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
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(
                          text: "Mobile Number\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Enter your mobile number, we will send you the OTP to verify",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        child: Center(
                          widthFactor: 0.0,
                          child: Text(
                            '+62',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    validator: (value) => _formValidation.validatePhone(value),
                    controller: provider.phoneNumber,
                    keyboardType: TextInputType.number,
                  ),
                  GestureDetector(
                    onTap: () => provider.SendOTP(
                      context: context,
                      key: _formKey,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFF1A714B),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 30,
                              color: Color(0xFF666666).withOpacity(.11),
                            ),
                          ],
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
