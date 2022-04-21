import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/components/dashboard_c.dart';
import 'package:student_id/components/image_edit_c.dart';
import 'package:student_id/components/qr_scanner.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/components/walletConnect_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/screens/wallet_connect/wallet_connect.dart';
import 'package:student_id/services/storage.dart';
import 'package:wallet_connect/wallet_connect.dart';

class ToolsPageBody extends StatelessWidget {

  final DashBoardModel? model;
  final Function? pickImage;

  ToolsPageBody({ Key? key, this.model, this.pickImage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, provider, widget){
        return Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    height: 107,
                    child: Stack(
                      children: <Widget>[

                        model!.cover.contains("https")
                        ? Image.network(
                          model!.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.2,
                          fit: BoxFit.cover,
                        )
                        : Image.file(
                          File(model!.cover),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.2,
                          fit: BoxFit.cover,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.2,
                          color: Colors.black.withOpacity(0.5)
                        ),

                        Positioned(
                          left: paddingSize,
                          top: (107-66) / 2,
                          child: Container(
                            height: 66,
                            width: 66,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(3),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: model!.profile.contains("https")
                                ? Image.network(
                                    model!.profile,
                                    height: 66,
                                    width: 66,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(model!.profile),
                                    height: 66,
                                    width: 66,
                                    fit: BoxFit.cover,
                                  )
                                ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 0,
                          child: Align(
                            alignment: Alignment.centerRight,
                            // right: paddingSize,
                            // top: (107-32) / 2,
                            child: TextButton(
                              onPressed: (){},
                              child: Row(
                                children: [
                                  MyText(text: "Verify", color: AppColors.primary, right: 5),
                                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white,)
                                ]
                              )
                            ),
                          ),
                        )
                      ],
                    )
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[350],
                    padding: EdgeInsets.all(paddingSize),
                    margin: EdgeInsets.only(bottom: paddingSize),
                    child: Row(
                      children: [
                        MyText(text: "Accounts", fontWeight: FontWeight.bold, textAlign: TextAlign.left),
                        Expanded(child: Container()),
                        CupertinoSwitch(
                          value: true,
                          onChanged: (bool value){

                          },
                        )
                      ],
                    ),
                  ),

                  MyListTile(
                    leading: SvgPicture.asset(AppConfig.iconPath+"buy.svg"),
                    title: "Buy",
                    trailing: Icon(Icons.arrow_forward_ios, size: 13),
                  ),

                  MyListTile(
                    leading: SvgPicture.asset(AppConfig.iconPath+"borrow.svg"),
                    title: "Borrow",
                    trailing: Icon(Icons.arrow_forward_ios, size: 13),
                  ),

                  MyListTile(
                    leading: SvgPicture.asset(AppConfig.iconPath+"exchange.svg"),
                    title: "Exchange",
                    trailing: Icon(Icons.arrow_forward_ios, size: 13),
                  ),

                  MyListTile(
                    leading: SvgPicture.asset(AppConfig.iconPath+"stack.svg",),
                    title: "Stack & Earn",
                    trailing: Icon(Icons.arrow_forward_ios, size: 13),
                  ),

                  Consumer<WalletConnectComponent>(
                    builder: (context, provider, widget){
                      return MyListTile(
                        action: () async {
                          if (provider.sessionStore == null){
                            String? value = await Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample()));
                              print("my value $value");
                              if (value != null){
                                
                                WalletConnectComponent _wConnectC = Provider.of<WalletConnectComponent>(context, listen: false);
                                _wConnectC.setBuildContext = context;
                                _wConnectC.qrScanHandler(value);
                              }
                          } else {

                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => WalletConnectPage() )
                            );
                          }
                        },
                        leading: SvgPicture.asset(AppConfig.logoPath+"walletconnect-logo.svg", width: 32.99, height: 19.87),
                        title: "WalletConnect",
                        trailing: provider.sessionStore == null ? Icon(Icons.arrow_forward_ios, size: 13) : MyText(text: "connected", color: AppColors.primary,),
                      );
                    }
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[350],
                    padding: EdgeInsets.all(paddingSize),
                    child: MyText(text: "Settings", fontWeight: FontWeight.bold, textAlign: TextAlign.left),
                  ),

                  MyListTile(
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    leading: Icon(Icons.nightlight_outlined),
                    title: "Night Mode",
                    trailing: CupertinoSwitch(
                      value: false,
                      onChanged: (bool value){

                      },
                    ),
                  ),
                  
                  MyListTile(
                    action: () async {
                      WalletConnectComponent _session = Provider.of<WalletConnectComponent>(context, listen: false);
                      if ( _session.sessionStore != null){
                        _session.wcClient.killSession();
                      }
                      MyDialog().dialogLoading(context);
                      await StorageServices.removeKey(DbKey.login);
                      await Future.delayed(Duration(seconds: 1), (){

                      }); 
                      Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                    },
                    leading: Icon(Icons.logout_outlined, color: Colors.red,),
                    title: "Log out",
                    titleColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}