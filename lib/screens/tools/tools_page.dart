import 'package:flutter/material.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return const ToolsPageBody();
  }
}
