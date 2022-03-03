import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:bip39/bip39.dart' as bip39;

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  _CreateWalletPagetScreenState createState() =>
      _CreateWalletPagetScreenState();
}

class _CreateWalletPagetScreenState extends State<CreateWalletPage> {
  bool initial = true;
  String seed = '';

  void generateKey() async {
    setState(() {
      seed = bip39.generateMnemonic();
    });
  }

  @override
  void didChangeDependencies() async {
    if (initial) {
      seed = bip39.generateMnemonic();

      setState(() {
        initial = false;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CreateKeyBody(
      initial: initial,
      seed: seed,
      generateKey: generateKey,
    );
  }
}
