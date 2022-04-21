import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class StoragesPageBody extends StatelessWidget {
  const StoragesPageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(AppConfig.illusPath+"developing.jpg"),
              ),
              MyText(
                top: paddingSize,
                text: "Feature is under development",
                fontSize: 20,
  
              )
            ],
          )
        ),
      ),
    );
  }
}