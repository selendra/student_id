import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/provider/registration_p.dart';
import 'package:student_id/screens/otp_verify/body_otp_verify_page.dart';
import 'package:student_id/services/storage.dart';
import 'package:encrypt/encrypt.dart';


class OTPVerifyPage extends StatefulWidget {

  @override
  _OTPVerifyPageState createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  final TextEditingController verifyInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void validator() async {
    final form = formKey.currentState!;

    // Show Loading
    MyDialog().dialogLoading(context);

    // if (form.validate()) {

      
    // }
  }

  void onChanged(String value) async {
    if (value.length == 4){

      await StorageServices.fetchData(DbKey.otpCode).then((otp) async {
        String decrypt = Encryption().decryptAES(otp);
        if (value == decrypt){

          RegistrationProvider _registerProvider = Provider.of<RegistrationProvider>(context, listen: false);

          Map<String, dynamic>? map = {
            'usrName': '',
            'email': _registerProvider.email,
            'password': _registerProvider.password,
            'seed': verifyInputController.text
          };
          
          // Encrypt Data
          Encrypted _encrypted = Encryption().encryptAES(json.encode(map));
          await StorageServices.storeData(_encrypted.bytes, DbKey.sensitive);

          await MyDialog().customDialog(context, "Message", "Successfully verify");
          await StorageServices.storeData(true, DbKey.login);
          
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardPage()), (route) => false);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const SetupPage()));
        } else {
          await MyDialog().customDialog(context, "Oops", "Incorrect code");
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OTPVerifyPageBody(
      verifyInputController: verifyInputController,
      formKey: formKey,
      onChanged: onChanged,
      validator: validator
    );
  }
}
