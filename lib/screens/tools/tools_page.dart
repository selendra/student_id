import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/screens/tools/tools_page_body.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return const ToolsPageBody();
  }
}
