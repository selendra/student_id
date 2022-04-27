import 'dart:io';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/main.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/identifier/identifier_option.dart';
import 'package:student_id/theme/theme.dart';

class IdentityInfo extends StatelessWidget{

  final DashBoardModel? dashBoardModel;
  final Function? submitEdit;

  IdentityInfo({this.dashBoardModel, this.submitEdit});
  
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              margin: EdgeInsets.symmetric(vertical: paddingSize),
              child: Consumer<HomeProvider>(
                builder: (context, provider, widget){
                  print("HomeProvider ${provider.homeModel.wallet}");
                  return Column(
                    children: [
                      QrImage(
                        data: provider.homeModel.wallet,
                        version: QrVersions.auto,
                        size: 250,
                        gapless: false,
                        embeddedImage: const AssetImage('assets/logos/telegram-logo.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(80, 80),
                        ),
                      ),

                      MyText(
                        width: MediaQuery.of(context).size.width/1.5,
                        text: provider.homeModel.wallet 
                      )
                    ],
                  );
                },
              )
            ),
            

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

            Consumer<IdentifierProvider>(
              builder: (context, provider, widget){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                  child: 
                  // provider.alreadySetup == false 
                  // ? 
                  ElevatedButton(
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(
                        Colors.transparent
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        HexColor(AppColors.primary).withOpacity(0.2)
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateWalletPage()));
                    }, 
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      alignment: Alignment.center,
                      child: MyText(
                        text: "Submit to Blockchain",
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      )
                    )
                  )

                  // : Card(
                  //   child: Column(
                  //     children: [
                  //       Image.file(File(provider.identifierModel!.frontImage!), width: 400, height: 200,)
                  //     ],
                  //   ),
                  // )
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Please get your "
                ),
                TextButton(
                  onPressed: (){
                    
                  }, 
                  child: MyText(
                    text: "Digital ID",
                    color: AppColors.primary,
                  ),
                ),
                MyText(
                  text: "before continue"
                ),
              ],
            )

          ],
        )
      ),
    );
  }
}