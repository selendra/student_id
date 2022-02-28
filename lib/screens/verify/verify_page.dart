import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';


class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController verifyInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void validator() {
    final form = formKey.currentState!;

    if (form.validate()) {
      Navigator.pushReplacementNamed(context, navbarRoute);
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
