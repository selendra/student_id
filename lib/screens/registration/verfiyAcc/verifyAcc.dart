import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/backend.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/sign_up_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/services/storage.dart';

class VerifyAcc extends StatefulWidget {

  final SignUpModel? signUpModel;

  const VerifyAcc({ Key? key, required this.signUpModel}) : super(key: key);

  @override
  State<VerifyAcc> createState() => _VerifyAccState();
}

class _VerifyAccState extends State<VerifyAcc> {

  Future<void> verifyAcc() async {
    MyDialog().dialogLoading(context);
    try {

      await Backend().login(widget.signUpModel!.emailInputController.text, widget.signUpModel!.passwordInputController.text).then((value) async {
        Navigator.pop(context);
        if (value.statusCode == 200){
          dynamic decode = json.decode(value.body);
          await MyDialog().customDialog(context, "Message", "${decode['message']}");
          await StorageServices.storeData(decode['access_token'], DbKey.token);
          Navigator.pushNamed(context, setupRoute);
        } else {
          await MyDialog().customDialog(context, "Oops", "Please verify your email first!");
        }
      });
    } catch (e){
      Navigator.pop(context);
      print("Error verifyAcc $e");
    }
  }

  Future<void> registerWithBlockchain() async {
    // Register SEL network
    await Provider.of<ApiProvider>(context, listen: false).registerSELNetwork(email: widget.signUpModel!.emailInputController.text, password: widget.signUpModel!.passwordInputController.text).then((value) {
      if (value == true){
        print("Success with blockchain");
      }
      print("Not Success with blockchain");
    });
  }

  @override
  void initState() {
    registerWithBlockchain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            width: MediaQuery.of(context).size.width / 1.3,
            text: "We sent a verify link in your email\nTo able to go next please check and verify your account!",
            bottom: paddingSize,
          ),

          SubmitButton(
            text: 'Submit',
            onPressed: () async {
              await verifyAcc();
            },
          )
        ],
      ),
    );
  }
}