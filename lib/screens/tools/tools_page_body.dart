import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/services/storage.dart';

class ToolsPageBody extends StatelessWidget {
  const ToolsPageBody({ Key? key }) : super(key: key);

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
              profileWidget(context, pickImage: (){}, model: DashBoardModel()),
              const DashboardOptions(),
              const ToolsInfo(),
              AddButton(
                text: 'Add Services',
                icon: Icons.storage_outlined,
                onPressed: () {},
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () async {
                    MyDialog().dialogLoading(context);
                    await StorageServices.removeKey(DbKey.login);
                    await Future.delayed(Duration(seconds: 1), (){

                    }); 
                    Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                  }, 
                  child: MyText(top: paddingSize, text: "Log out", color2: Colors.red, fontWeight: FontWeight.w700,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}