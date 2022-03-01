import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class StoragesPageBody extends StatelessWidget {
  const StoragesPageBody({ Key? key }) : super(key: key);

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