import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/screens/otp_verify/body_otp_verify_page.dart';
import 'package:student_id/services/storage.dart';

import '../../widgets/build_line_top.dart';
import '../test_screen_ui.dart';


class OTPVerifyPage extends StatefulWidget {
  const OTPVerifyPage({Key? key}) : super(key: key);

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

          await MyDialog().customDialog(context, "Message", "Successfully verify");
          
          // Navigator.pushNamedAndRemoveUntil(context, navbarRoute, (route) => false);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SetupPage()));
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
    return Scaffold(
      body: TestGlasUI(
        body: OTPVerifyPageBody(
              verifyInputController: verifyInputController,
              formKey: formKey,
              onChanged: onChanged,
              validator: validator
            ),
      ),
    );
  }
}
