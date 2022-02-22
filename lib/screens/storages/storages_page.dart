import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class StoragesPage extends StatefulWidget {
  const StoragesPage({Key? key}) : super(key: key);

  @override
  _StoragesPageState createState() => _StoragesPageState();
}

class _StoragesPageState extends State<StoragesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profileWidget(context),
              const DashboardOptions(),
              const StoragesInfo(),
              AddAssetButton(text: 'Add Services', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
