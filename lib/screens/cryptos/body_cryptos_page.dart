import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_id/screens/cryptos/assets_crypto.dart';
import 'package:student_id/screens/cryptos/histroy_crypto.dart';
import 'package:student_id/theme/theme.dart';

class CryptosPageBody extends StatelessWidget {

  final TabController? tabController;
  final Function? tabChanged;

  const CryptosPageBody({this.tabController, this.tabChanged, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(AppColors.bgColor),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                
              Container(
                height: 90,
                padding: EdgeInsets.symmetric(vertical: paddingSize),
                child: Stack(
                  children: [

                    Center(
                      child: MyText(
                        text: "My Wallet", 
                        fontSize: 23,
                      )
                    ),

                    Positioned(
                      right: 50,
                      top: 0,
                      // top: paddingSize,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: SvgPicture.asset(AppConfig.iconPath+"menu_vertical.svg", width: 25,)
                      )
                    )
                  ],
                ),
              ),

              MyText(
                text: "10,000", 
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                bottom: paddingSize,
              ),

              MyText(
                text: "≈ 1,500\$", 
                fontSize: 23,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                child: Row(
                  children: [
                    
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Container(
                          height: 54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppConfig.iconPath+"send.svg", width: 19, color: Colors.white,),
                              MyText(text: "SEND", color2: Colors.white, left: 5,)
                            ],
                          )
                        )
                      ),
                    ),

                    SizedBox(width: paddingSize,),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Container(
                          height: 54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppConfig.iconPath+"qr.svg", width: 19, color: Colors.white),
                              MyText(text: "RECEIVE", color2: Colors.white, left: 5,)
                            ],
                          )
                        )
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                child: TabBar(
                  onTap: (int index){
                    tabChanged!(index);
                  },
                  tabs: [
                    
                    MyText(text: "Assets"),

                    MyText(text: "History")
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    CryptoAssets(),
                    CryptoHistory(),
                  ]
                )  ,
              )

              // profileWidget(context, pickImage: (){}, model: DashBoardModel()),
              // const DashboardOptions(),
              // titleDashboard('Cryptos Assets', context),
              // const CryptosAssetInfo(),
              // AddButton(
              //   text: 'Add Asset',
              //   onPressed: () {}
              // ),
            ],
          ),
        ),
      ),
    );
  }
}