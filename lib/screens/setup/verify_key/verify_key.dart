import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';


class VerifyPassphrase extends StatefulWidget {
  const VerifyPassphrase({Key? key}) : super(key: key);

  @override
  State<VerifyPassphrase> createState() => _VerifyPassphraseState();
}

class _VerifyPassphraseState extends State<VerifyPassphrase> {

  final TextEditingController passphraseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return VerifyPassphraseBody(
      phraseKey: passphraseController,
    );
  }
}
