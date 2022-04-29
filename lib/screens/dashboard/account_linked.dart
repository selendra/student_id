import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_id/components/walletConnect_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/provider/api_provider.dart';

class AccountLinked extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletConnectComponent>(
      builder: (context, provider, widget){
        return Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: paddingSize, right: paddingSize, top: paddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(bottom: paddingSize),
                    child: Image.asset(AppConfig.logoPath+"MoEY.png", width: 80,),
                  ),

                  MyText(
                    text: "MoEYs",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    bottom: paddingSize+paddingSize
                  ),

                  Row(
                    children: [
                      MyText(
                        text: "Connected to"
                      ),
                      Expanded(
                        child: MyText(
                          textAlign: TextAlign.end,
                          text: "MoEYs Wordpress",
                          color2: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        )
                      ),
                    ]
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: paddingSize, bottom: paddingSize),
                    child: Divider(
                      height: 1,
                    )
                  ),

                  Consumer<ApiProvider>(
                    builder: (context, provider, widget){
                      return Row(
                        children: [
                          MyText(
                            text: "Address"
                          ),
                          Expanded(
                            child: MyText(
                              textAlign: TextAlign.end,
                              text: provider.accountM.address == null ? '...' :  provider.accountM.address!.replaceRange( 10, provider.accountM.address!.length - 10, "....."),
                              color2: Colors.grey,
                            )
                          ),
                        ]
                      );
                    }
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: paddingSize, bottom: paddingSize),
                    child: Divider(
                      height: 1,
                    )
                  ),

                  Consumer<ApiProvider>(
                    builder: (context, provider, widget){
                      return Row(
                        children: [
                          MyText(
                            text: "Network"
                          ),
                          Expanded(
                            child: MyText(
                              textAlign: TextAlign.end,
                              text: "fxqwjnewkjsdfksdlf",
                              color2: Colors.grey,
                            )
                          ),
                        ]
                      );
                    }
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: paddingSize, bottom: paddingSize),
                    child: Divider(
                      height: 1,
                    )
                  ),

                ],
              ),
            )
          ),
        );
      },
    );
  }
}