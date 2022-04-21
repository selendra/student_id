import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/models/dashboard_m.dart';


class CryptosPage extends StatefulWidget {
  const CryptosPage({Key? key}) : super(key: key);

  @override
  _CryptosPageState createState() => _CryptosPageState();
}

class _CryptosPageState extends State<CryptosPage> with TickerProviderStateMixin {

  TabController? tabController;

  void tabChanged(int index){
    setState(() {
      tabController!.animateTo(index);
    });
  }
  
  @override
  initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: CryptosPageBody(
        tabController: tabController,
        tabChanged: tabChanged
      )
    );
  }
}
