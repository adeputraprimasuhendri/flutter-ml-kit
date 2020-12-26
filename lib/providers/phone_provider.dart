import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/screens/Dashboard_screen.dart';
import 'package:flutter_ml_kit/screens/OTP_screen.dart';
import 'package:flutter_ml_kit/screens/Phone_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController codeNumber = TextEditingController();

  String _verificationId;
  bool smsSent = false;

  SendOTP({
    @required BuildContext context,
    @required GlobalKey<FormState> key,
  }) async {
    if (key.currentState.validate()) {
      key.currentState.save();
      final PhoneVerificationCompleted verified = (AuthCredential authResult) {
        FirebaseAuth.instance.signInWithCredential(authResult);
      };
      final PhoneVerificationFailed verificationFailed =
          (AuthException authException) {};
      final PhoneCodeSent smsCodeSent =
          (String verId, [int forceResend]) async {
        _verificationId = verId;
        final _smsCode = await Navigator.pushNamed(context, OTPScreen.route);
        AuthCredential authCredential = await PhoneAuthProvider.getCredential(
          verificationId: _verificationId,
          smsCode: _smsCode,
        );
        final _user =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        if (_user.user.phoneNumber != null) {
          await Navigator.pushNamedAndRemoveUntil(
            context,
            DashboardScreen.route,
            (route) => false,
          );
        }
      };
      final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
        _verificationId = verId;
      };
      await _auth.verifyPhoneNumber(
        phoneNumber: '+62' + phoneNumber.text,
        timeout: const Duration(seconds: 15),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoTimeout,
      );
      notifyListeners();
    }
  }

  VerfiyPhone(BuildContext context) async {
    return Navigator.pop(
      context,
      codeNumber.text.trim(),
    );
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.pushNamedAndRemoveUntil(
      context,
      PhoneScreen.route,
      (route) => false,
    );
  }
}
