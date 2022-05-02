import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/screens/digital_id/front_side/body_front_side.dart';
import 'package:student_id/screens/digital_id/front_side/front_side.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DigitalIDOption extends StatelessWidget {
  const DigitalIDOption({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarCustom("Document Verification", context),
      body: Padding(
        padding: EdgeInsets.all(paddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Hint To upload Card
            MyText(
              text: "Your document photo helps us prove your identity.It should match the information you have provided in the previous steps.",
              fontSize: 16,
              bottom: 30,
            ),

            SizedBox(height: paddingSize,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 15),
                height: btnHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: HexColor("#F3F3F3")
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppConfig.iconPath+"id_card.svg"),
                    MyText(
                      left: 10,
                      text: "National ID"
                    ),
                    Expanded(child: Container()),

                    Icon(Icons.arrow_forward_outlined, size: 24,)
                  ],
                ),
              ),
            ),
            SizedBox(height: paddingSize,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 15),
                height: btnHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: HexColor("#F3F3F3")
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppConfig.iconPath+"id_card.svg"),
                    MyText(
                      left: 10,
                      text: "Student ID"
                    ),
                    Expanded(child: Container()),

                    Icon(Icons.arrow_forward_outlined, size: 24,)
                  ],
                ),
              ),
            ),
            SizedBox(height: paddingSize,),
            
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 15),
                height: btnHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: HexColor("#F3F3F3")
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppConfig.iconPath+"car.svg"),
                    MyText(
                      left: 10,
                      text: "Driver’s Licence"
                    ),

                    Expanded(child: Container()),

                    Icon(Icons.arrow_forward_outlined, size: 24,)
                  ],
                ),
              ),
            ),

          ]
        ),
      )
    );
  }
}