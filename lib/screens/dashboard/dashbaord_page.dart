import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/dashboard/body_dashboard.dart';
import 'package:student_id/services/storage.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  
  TextEditingController phraseKey = TextEditingController();
  DashBoardModel dashBoardM = DashBoardModel();
  IdentifierModel _identifierModel = IdentifierModel();

  Future pickImage(ImageSource source, String? label) async {

    final pickedFile = await ImagePicker.platform.pickImage(source: source);
    
    if (pickedFile != null){
      setState(() {
        if (label == 'cover'){
          dashBoardM.cover = pickedFile.path;
        } else {

          dashBoardM.profile = pickedFile.path;
        }
      });
    }
  }
  
  void edit(){
    setState(() {
      dashBoardM.isEditing = !dashBoardM.isEditing;
      if (dashBoardM.isEditing == false) resetEdit();
    });
  }

  void resetEdit(){
    setState(() {
      
      dashBoardM.nameController.text = dashBoardM.name;
      dashBoardM.emailController.text = dashBoardM.email;
      dashBoardM.nationalityController.text = dashBoardM.nationality;
      dashBoardM.phoneNumController.text = dashBoardM.phoneNum;
    });
  }

  void btn()async {

    await Provider.of<ApiProvider>(context, listen: false).addAcc(context: context);
  }

  @override
  void initState() {
    dashBoardM.name = "Rithy THUL";
    dashBoardM.email = "rithythul@gmail.com";
    dashBoardM.nationality = "Cambodian";
    dashBoardM.phoneNum = "+855-77-202-202";

    dashBoardM.nameController.text = "Rithy THUL";
    dashBoardM.emailController.text = "rithythul@gmail.com";
    dashBoardM.nationalityController.text = "Cambodian";
    dashBoardM.phoneNumController.text = "+855-77-202-202";
    // StorageServices.removeKey(DbKey.idKey);
    initId();
    super.initState();
  }

  initId() async {
    await StorageServices.fetchData(DbKey.idKey).then((value) {
      if (value != null){
        _identifierModel = IdentifierModel().fromDb(value);
        Provider.of<IdentifierProvider>(context, listen: false).setSetup = true;
        setState(() {
        });
      }
    });
  }

  void submitEdit(){
    dashBoardM.name = dashBoardM.nameController.text;
    dashBoardM.email = dashBoardM.emailController.text;
    dashBoardM.nationality = dashBoardM.nationalityController.text;
    dashBoardM.phoneNum = dashBoardM.phoneNumController.text;
    dashBoardM.isEditing = false;

    setState(() {
      
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoardBody(dashModel: dashBoardM, idModel: _identifierModel, edit: edit, pickImage: pickImage, submitEdit: submitEdit);
  }
}
