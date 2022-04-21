import 'package:student_id/all_export.dart';
import 'package:student_id/components/dashboard_c.dart';
import 'package:student_id/main.dart';

class CryptoAssets extends StatelessWidget{

  double logoSize = 45;
  double lsTileHeight = 70;
  
  BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey, width: 0.3)
  );

  late Widget logo;

  CryptoAssets(){
    logo = CircleAvatar(
      backgroundColor: HexColor(AppColors.primary).withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: SvgPicture.asset(AppConfig.logoPath+"selendra.svg", width: logoSize)
      ),
    );
  }
  
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: paddingSize),
      child: Column(
        children: [

          MyListTile(
            height: lsTileHeight,
            decoration: decoration,
            title: "SEL",
            leading: logo,
            trailing: MyText(text: "16,0012", color: AppColors.primary, fontSize: 15,),
          ),
          MyListTile(
            height: lsTileHeight,
            decoration: decoration,
            title: "RISE",
            leading: logo,
            trailing: MyText(text: "16,0012", color: AppColors.primary, fontSize: 15,),
          ),
          MyListTile(
            height: lsTileHeight,
            decoration: decoration,
            title: "BTC",
            leading: logo,
            trailing: MyText(text: "16,0012", color: AppColors.primary, fontSize: 15,),
          )
        ],
      ),
    );
  }
}