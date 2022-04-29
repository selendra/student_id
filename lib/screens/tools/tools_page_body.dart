import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
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
  const ToolsPageBody({ Key? key }) : super(key: key);

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
                  
                  profileWidget(context, pickImage: (){}, model: DashBoardModel()),
                  const DashboardOptions(),
                  const ToolsInfo(),
                  // AddButton(
                  //   text: 'Add Services',
                  //   onPressed: () {},
                  // ),

                  // Row(  
                  //   children: [
                  //     MyText(
                  //       text: "Wallet:"
                  //     ),
                  //     Expanded(
                  //       child: MyText(
                  //         textAlign: TextAlign.end,
                  //         text: provider.accountM.address ?? '',
                  //         color2: Colors.grey,
                  //         overflow: TextOverflow.ellipsis,
                  //       )
                  //     ),
                  //   ]
                  // ),

                  // Consumer<WalletConnectComponent>(
                  //   builder: (context, provider, widget){

                  //     return provider.sessionStore == null ? CustomBtn(
                  //       title: 'Scan with WalletConnect',
                  //       logo: 'walletconnect-logo.svg',
                  //       onPressed: () async {

                  //         String? value = await Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample()));
                  //         print("my value $value");
                  //         if (value != null){
                            
                  //           WalletConnectComponent _wConnectC = Provider.of<WalletConnectComponent>(context, listen: false);
                  //           _wConnectC.setBuildContext = context;
                  //           _wConnectC.qrScanHandler(value);
                  //           print("finish qrScanHandler");
                  //         }
                  //       },
                  //     ) 
                  //     : Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         ElevatedButton(
                  //           onPressed: (){
                  //             Navigator.push(
                  //               context, 
                  //               MaterialPageRoute(builder: (context) => WalletConnectPage() )
                  //             );
                  //           }, 
                  //           child: MyText(
                  //             color2: Colors.white,
                  //             text: "WalletConnect is connected"
                  //           )
                  //         )
                  //       ],
                  //     );
                  //   }
                  // ),
                  

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () async {
                        WalletConnectComponent _session = Provider.of<WalletConnectComponent>(context, listen: false);
                        if ( _session.sessionStore != null){
                          _session.wcClient.killSession();
                        }
                        MyDialog().dialogLoading(context);

                        // Clear Cache Data
                        await StorageServices.clearAllData();

                        print("finish clear all data");

                        // Delete Account From Substrate
                        ApiProvider _api = Provider.of<ApiProvider>(context, listen: false);
                        await _api.apiKeyring.deleteAccount(
                          _api.getKeyring,
                          _api.getKeyring.current,
                        );
                        print("_api.getKeyring ${_api.getKeyring}");
                        print("_api.accountM.currentAcc! ${_api.getKeyring.current}");

                        print("finish clear _api.apiKeyring");

                        await Future.delayed(Duration(seconds: 1), (){

                        }); 
                        Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                      }, 
                      child: MyText(top: paddingSize, text: "Log out", color2: Colors.red, fontWeight: FontWeight.w700,)
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}