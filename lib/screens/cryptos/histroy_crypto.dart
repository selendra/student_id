import 'package:student_id/all_export.dart';

class CryptoHistory extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            onTap: (){},
            leading: SvgPicture.asset(AppConfig.iconPath+ (index % 2 == 0 ? "arrow-up-right.svg" : "arrow-down-left.svg"), width: 40, color: (index % 2 == 0 ? HexColor(AppColors.primary) : Colors.red),),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: "Deposit", textAlign: TextAlign.left,),
                MyText(text: "Apr 19 2022", fontSize: 10, color: AppColors.secondary, textAlign: TextAlign.left)
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(text: "0.5 SEL", textAlign: TextAlign.right),
                MyText(text: "0.5 SEL", fontSize: 10, textAlign: TextAlign.right)
              ],
            ),
          );
        }
      ),
    );
  }
}