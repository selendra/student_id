import 'dart:io';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/dashboard/indentityInfo.dart';
import 'package:student_id/screens/identifier/identifier_option.dart';
import 'package:student_id/screens/mint_data/mint_data.dart';

class DashBoardBody extends StatelessWidget {

  final DashBoardModel? dashModel;
  final IdentifierModel? idModel;
  final TabController? tabController;
  final Function? onTab;
  final Function? edit;
  final Function? pickImage;
  final Function? submitEdit;

  const DashBoardBody({ 
    Key? key, 
    required this.dashModel, 
    required this.idModel, 
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                      
                      Consumer<IdentifierProvider>(
                        builder: (context, provider, widget){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Stack(
                                alignment: Alignment.center,
                                children: [

                                  Icon(Icons.people_alt_outlined, size: 40, color: provider.alreadySetup! ? Colors.blue : greyColor,),

                                  provider.alreadySetup! 
                                  ? const Positioned(
                                    child: Icon(Icons.check, size: 20, color: Colors.blue),
                                    right: 0,
                                    bottom: 0,
                                  ) 
                                  : Container()
                                ],
                              ),
                              Text(
                                'Verify',
                                style: TextStyle(color: provider.alreadySetup! ? Colors.blue : greyColor, fontWeight: FontWeight.w600),
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
                              qrCodeAlertDialog(context);
                            },
                            icon: const Icon(Icons.share_outlined),
                            iconSize: 40,
                            color: greyColor,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),

                    ]
                  ),

                  titleDashboard(dashModel!.titlePage, context),

                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          PersonlInfo(model: dashModel, edit: edit),
                          IdentityInfo(dashBoardModel: dashModel, submitEdit: edit),
                          IdentityInfo(dashBoardModel: dashModel, submitEdit: edit),
                        ]
                      ),
                    )
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