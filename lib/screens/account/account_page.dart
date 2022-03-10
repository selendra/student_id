import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/models/dashboard_m.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return AccountPageBody();
=======
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profileWidget(context, pickImage: (){}, model: DashBoardModel()),
              const DashboardOptions(),
              const LinkedAccountInfo()
            ],
          ),
        ),
      ),
    );
>>>>>>> origin/daveat
  }
}
