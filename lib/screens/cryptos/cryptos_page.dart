import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/models/dashboard_m.dart';


class CryptosPage extends StatefulWidget {
  const CryptosPage({Key? key}) : super(key: key);

  @override
  _CryptosPageState createState() => _CryptosPageState();
}

class _CryptosPageState extends State<CryptosPage> {
  @override
  Widget build(BuildContext context) {
    return CryptosPageBody();
  }
}
