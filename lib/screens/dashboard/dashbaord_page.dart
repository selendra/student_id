import 'dart:convert';
import 'dart:io';

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
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/provider/registration_p.dart';
import 'package:student_id/screens/dashboard/body_dashboard.dart';
import 'package:student_id/services/services_s.dart';
import 'package:student_id/services/storage.dart';

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  
  TextEditingController phraseKey = TextEditingController();
  DashBoardModel _dashBoardM = DashBoardModel();
  IdentifierModel _identifierModel = IdentifierModel();
  TabController? _tabController;

  Future pickImage(ImageSource source, String? label) async {

    final pickedFile = await Services.pickImage(source);
    
    if (pickedFile != null){
      setState(() {
        if (label == 'cover'){
          _dashBoardM.cover = pickedFile.path;
        } else {

          _dashBoardM.profile = pickedFile.path;
        }
      });
    }
  }
  
  void edit(){
    setState(() {
      _dashBoardM.isEditing = !_dashBoardM.isEditing;
      if (_dashBoardM.isEditing == false) resetEdit();
    });
  }

  void resetEdit(){
    setState(() {
      
      _dashBoardM.nameController.text = _dashBoardM.name;
      _dashBoardM.emailController.text = _dashBoardM.email;
      _dashBoardM.nationalityController.text = _dashBoardM.nationality;
      _dashBoardM.phoneNumController.text = _dashBoardM.phoneNum;
    });
  }

  void onTab(int index){
    setState(() {
      if (index == 0){
        _dashBoardM.titlePage = "Basic Info";
      } else if (index == 1) {
        String _wallet = Provider.of<HomeProvider>(context, listen: false).homeModel.wallet;
        _dashBoardM.titlePage = "Your wallet address: ${_wallet.replaceRange( 5, _wallet.length - 5, ".....")}";
      }
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _dashBoardM = Provider.of<HomeProvider>(context, listen: false).homeModel;
    // StorageServices.removeKey(DbKey.idKey);
    initId();
    super.initState();
  }

  /// For Check Identity Setup (National ID, Student)
  initId() async {
    await StorageServices.fetchData(DbKey.idKey).then((value) {
      if (value != null){
        _identifierModel = IdentifierModel().fromDb(value);
        Provider.of<IdentifierProvider>(context, listen: false).setSetup = true;
        setState(() { });
      }
    });

    await StorageServices.fetchData(DbKey.sensitive).then((value) async {
      print("fetchData $value");
      if (value != null){

        Map<String, dynamic> data = await json.decode(Encryption().decryptAES(value));

        print(data);

        _dashBoardM.name = data['usrName'] == "" ? "None" : data['usrName'];
        _dashBoardM.email = data['email'] == "" ? "None" : data['email'];
        _dashBoardM.nameController.text = data['usrName'] == "" ? "None" : data['usrName'];
        _dashBoardM.emailController.text = data['email'] == "" ? "None" : data['email'];
      }
      
    });
    setState(() { });
  }

  void submitEdit(){
    _dashBoardM.name = _dashBoardM.nameController.text;
    _dashBoardM.email = _dashBoardM.emailController.text;
    _dashBoardM.nationality = _dashBoardM.nationalityController.text;
    _dashBoardM.phoneNum = _dashBoardM.phoneNumController.text;
    _dashBoardM.isEditing = false;

    setState(() {
      
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: DashBoardBody(
        dashModel: _dashBoardM,
        onTab: onTab,
        tabController: _tabController, 
        idModel: _identifierModel, 
        edit: edit, 
        pickImage: pickImage, submitEdit: submitEdit
      )
    );
  }
}
