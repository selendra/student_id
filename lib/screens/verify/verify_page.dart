import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';


class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController verifyInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void validator() async {
    final form = formKey.currentState!;

    // Show Loading
    MyDialog().dialogLoading(context);

    if (form.validate()) {
      await Future.delayed(const Duration(seconds: 1), () async {
        await MyDialog().customDialog(context, "Message", "Successfully login");
        
        Navigator.pushNamedAndRemoveUntil(context, navbarRoute, (route) => false);
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
    return VerifyPageBody(
      verifyInputController: verifyInputController,
      formKey: formKey,
      validator: validator
    );
  }
}
