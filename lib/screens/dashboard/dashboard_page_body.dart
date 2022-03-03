import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class DashboardPageBody extends StatelessWidget {
  const DashboardPageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profileWidget(context),
              const DashboardOptions(),
              const PersonlInfo()
            ],
          ),
        ),
      ),
    );
  }
}