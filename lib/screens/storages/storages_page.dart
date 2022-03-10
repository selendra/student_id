import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/models/dashboard_m.dart';


class StoragesPage extends StatefulWidget {
  const StoragesPage({Key? key}) : super(key: key);

  @override
  _StoragesPageState createState() => _StoragesPageState();
}

class _StoragesPageState extends State<StoragesPage> {
  @override
  Widget build(BuildContext context) {
    return const StoragesPageBody();
  }
}
