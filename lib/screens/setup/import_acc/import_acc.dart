import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/screens/setup/import_acc/body_import_acc.dart';
import 'package:student_id/services/storage.dart';


class ImportAccount extends StatefulWidget {
  const ImportAccount({Key? key}) : super(key: key);

  @override
  _ImportAccountState createState() => _ImportAccountState();
}

class _ImportAccountState extends State<ImportAccount> {
  final TextEditingController verifyInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void validator() async {
    final form = formKey.currentState!;

    // Show Loading
    MyDialog().dialogLoading(context);

    // if (form.validate()) {

      await Future.delayed(const Duration(seconds: 1), () async {
        await MyDialog().customDialog(context, "Message", "Successfully import");
        
        // Navigator.pushNamedAndRemoveUntil(context, navbarRoute, (route) => false);
        await StorageServices.storeData(true, DbKey.login);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar()));
      });
      
    // }
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
    return ImportAccountBody(
      verifyInputController: verifyInputController,
      formKey: formKey,
      validator: validator
    );
  }
}
