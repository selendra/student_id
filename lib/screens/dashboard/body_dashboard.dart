import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/digital_id_m.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/provider/digital_id_p.dart';
import 'package:student_id/screens/dashboard/account_linked.dart';
import 'package:student_id/screens/dashboard/indentityInfo.dart';
import 'package:student_id/services/services_s.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardBody extends StatelessWidget {

  final DashBoardModel? dashModel;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final TabController? tabController;
  final Function? onTab;
  final Function? edit;
  final Function? pickImage;
  final Function? submitEdit;

  const DashBoardBody({ 
    Key? key, 
    this.scaffoldKey,
    required this.dashModel, 
    this.tabController,
    required this.onTab,
    required this.edit, 
    required this.pickImage, 
    required this.submitEdit 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Consumer<HomeProvider>(
        builder: (context, provider, widget){
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  profileWidget(context, model: dashModel, pickImage: pickImage),

                  TabBar(
                    controller: tabController,
                    onTap: (index){
                      onTab!(index);
                    },
                    tabs: [
                      
                      Consumer<HomeProvider>(
                        builder: (context, provider, widget){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Stack(
                                alignment: Alignment.center,
                                children: [

                                  Icon(Icons.people_alt_outlined, size: 40, color: greyColor,),

                                  provider.successSubmitToBlockchain
                                  ? Positioned(
                                    child: Image.asset(AppConfig.iconPath+"check.png", width: 20),
                                    right: 0,
                                    bottom: 0
                                  ) 
                                  : Container()
                                ],
                              ),
                              Text(
                                'Verify',
                                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
                              )
                            ],
                          );
                        },
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_2_outlined, size: 40, color: greyColor,),
                          Text(
                            'Wallet ID',
                            style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // Services().qrShare(scaffoldKey!, "hello");
                            },
                            icon: const Icon(Icons.contact_page_outlined),
                            iconSize: 40,
                            color: greyColor,
                          ),
                          Text(
                            'Accounts',
                            style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),

                    ]
                  ),

                  titleDashboard(
                    dashModel!.titlePage, 
                    context, 
                    title2: tabController!.index == 0 ? InkWell(
                      onTap: (){
                        edit!();
                      }, 
                      child: MyText(text: dashModel!.isEditing ? "Un-do" : "Edit", fontWeight: FontWeight.bold, textAlign: TextAlign.right, right: paddingSize, color2: Colors.blue,)
                    ) : Container()
                  ),

                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        PersonlInfo(model: dashModel, edit: edit, submitEdit: submitEdit),
                        IdentityInfo(dashBoardModel: dashModel, submitEdit: edit),
                        AccountLinked(),
                      ]
                    ),
                  )

                ],
              )
            )
          );
        }
      )
    );
  }
}