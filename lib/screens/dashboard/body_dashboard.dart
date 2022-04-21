import 'dart:io';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/dashboard_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/identifier/identifier_option.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_id/theme/theme.dart';

class DashBoardBody extends StatelessWidget {

  final DashBoardModel? dashModel;
  final IdentifierModel? idModel;
  final Function? edit;
  final Function? pickImage;
  final Function? submitEdit;

  const DashBoardBody({ 
    Key? key, 
    required this.dashModel, 
    required this.idModel, 
    required this.edit, 
    required this.pickImage, 
    required this.submitEdit 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                // Header
                RowText(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  leading: MyText(
                    text: "ID Card",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          
                        }, 
                        icon: SvgPicture.asset(AppConfig.iconPath+"qr_scan.svg")
                      ),

                      IconButton(
                        onPressed: () async {
                          qrCodeAlertDialog(context);
                        },
                        icon: SvgPicture.asset(AppConfig.iconPath+"qr.svg")
                      )
                    ],
                  ),
                ),

                MyText(
                  left: paddingSize,
                  text: "Student Info",
                ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize-5),
                  child: Column(
                    children: [

                      RowText(
                        leading: MyText(text: "School name", color2: Colors.white, fontWeight: FontWeight.bold,),
                        trailing: CircleAvatar(
                          child: Container(),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                          color: HexColor(AppColors.primary).withOpacity(0.6),
                        ),
                      ),

                      RowText(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(text: "Name", color: AppColors.txtLabel, fontSize: 12,),
                            MyText(text: "Rithy THUL"),

                            MyText(text: "Date of birth", color: AppColors.txtLabel, fontSize: 12,),
                            MyText(text: "11/12/2000"),

                            MyText(text: "Country", color: AppColors.txtLabel, fontSize: 12,),
                            MyText(text: "Cambodia"),

                            MyText(text: "Email", color: AppColors.txtLabel, fontSize: 12,),
                            MyText(text: "rithythul@gmail.com"),

                            MyText(text: "Phone number", color: AppColors.txtLabel, fontSize: 12,),
                            MyText(text: "+855-77-202-202"),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Container(
                              width: 175,
                              height: 200,
                              child: Image.network(DashBoardModel().cover, fit: BoxFit.cover,),
                            ),
                            Container(
                              width: 175,
                              height: 30,
                              color: HexColor(AppColors.primary).withOpacity(0.6),
                              alignment: Alignment.center,
                              child: MyText(text: "Student", fontSize: 14, color2: Colors.white)
                            )
                          ],
                        ),
                      ),

                      RowText(
                        leading: MyText(text: "No digital ID", color2: Colors.red,),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const IDOption()));
                          }, 
                          child: Row(
                            children: [
                              MyText(
                                text: "Set up",
                                fontSize: 14,
                                color2: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17,)
                            ],
                          )
                        ),
                      )

                    ],
                  ),
                ),

                MyText(
                  top: paddingSize,
                  left: paddingSize,
                  text: "Linked Social Account",
                  bottom: paddingSize,
                ),

                MyListTile(
                  title: "None",
                  trailing: MyText(text: "Connected", color: AppColors.primary, fontSize: 15,),
                ),
                MyListTile(
                  title: "None",
                  trailing: MyText(text: "Connected", color: AppColors.primary, fontSize: 15,),
                ),
                MyListTile(
                  title: "None",
                  trailing: MyText(text: "Connected", color: AppColors.primary, fontSize: 15,),
                ),
                MyListTile(
                  title: "Rithy Thul",
                  trailing: MyText(text: "Connected", color: AppColors.primary, fontSize: 15,),
                )
                
                // profileWidget(context, model: dashModel, pickImage: pickImage),
                // const DashboardOptions(),
                // titleDashboard('Basic Info', context, title2: "Identities"),
                
                // PersonlInfo(model: dashModel, edit: edit),
              
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: paddingSize),
                //     child: Divider(
                //     height: 1,
                //     color: Colors.grey
                //   )
                // ),

                // Consumer<IdentifierProvider>(
                //   builder: (context, provider, widget){
                //     return provider.alreadySetup == true 
                //     ? MyText(
                //       text: provider.identifierModel!.title, 
                //       textAlign: TextAlign.left, 
                //       fontWeight: FontWeight.w600,
                //       top: paddingSize,
                //       left: paddingSize,
                //     ) 
                //     : Container();
                //   }
                // ),
                // Consumer<IdentifierProvider>(
                //   builder: (context, provider, widget){
                //     return Padding(
                //       padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                //       child: provider.alreadySetup == false 
                //       ? ElevatedButton(
                //         style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(
                //             Colors.transparent
                //           ),
                //           side: MaterialStateProperty.all(
                //             BorderSide()
                //           ),
                //           padding: MaterialStateProperty.all(EdgeInsets.zero),
                //           shape: MaterialStateProperty.all(
                //             RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(13)
                //             )
                //           ),
                //         ),
                //         onPressed: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context) => const IDOption()));
                //         }, 
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: 50,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(12)
                //           ),
                //           alignment: Alignment.center,
                //           child: MyText(
                //             text: "Setup your ID",
                //             fontWeight: FontWeight.w600,
                //             color2: Colors.white,
                //           )
                //         )
                //       )
                //       : Card(
                //         child: Column(
                //           children: [
                //             Image.file(File(provider.identifierModel!.frontImage!), width: 400, height: 200,)
                //           ],
                //         ),
                //       )
                //     );
                //   },
                // ),

                // dashModel!.isEditing == true 
                // ? Padding(
                //   padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: ElevatedButton(
                //       onPressed: (){
                //         submitEdit!();
                //       }, 
                //       style: ButtonStyle(
                //         shape: MaterialStateProperty.all(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(13)
                //           )
                //         ),
                //       ),
                //       child: Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 50,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12)
                //         ),
                //         alignment: Alignment.center,
                //         child: MyText(
                //           text: "Submit Edit",
                //           fontWeight: FontWeight.w600,
                //           color2: Colors.white,
                //         )
                //       )
                //     ),
                //   )
                // ) 
                // : Container(),
              ],
            )
          )
        ),
      ),
    );
  }
}