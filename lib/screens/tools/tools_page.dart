import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/walletConnect_c.dart';
import 'package:student_id/services/storage.dart';


class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {

  DashBoardModel model = DashBoardModel();

  @override
  initState(){
    checkSession();
    super.initState();
  }

  checkSession() async {
    print("checkSession");
    final pref = await SharedPreferences.getInstance();
    String? value = pref.getString("session");
    print("value $value");
    if (value != null){
      await Provider.of<WalletConnectComponent>(context, listen: false).connectToPreviousSession();
    }

  }

  Future pickImage(ImageSource source, String? label) async {

    final pickedFile = await ImagePicker.platform.pickImage(source: source);
    
    if (pickedFile != null){
      setState(() {
        if (label == 'cover'){
          model.cover = pickedFile.path;
        } else {

          model.profile = pickedFile.path;
        }
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ToolsPageBody(
      model: model,
      pickImage: pickImage
    );
  }
}
