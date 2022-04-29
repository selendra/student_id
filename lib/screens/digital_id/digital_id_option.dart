import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/screens/digital_id/front_side/body_front_side.dart';
import 'package:student_id/screens/digital_id/front_side/front_side.dart';

class DigitalIDOption extends StatelessWidget {
  const DigitalIDOption({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCustom("Identity Options", context),
      body: Column(
        children: [

          // Hint To upload Card
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
            },
            child: Card(
              margin: EdgeInsets.all(paddingSize),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.center,
                child: MyText(
                  bottom: paddingSize,
                  text: "National ID"
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
            },
            child: Card(
              margin: EdgeInsets.all(paddingSize),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.center,
                child: MyText(
                  bottom: paddingSize,
                  text: "Passport"
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontSide()));
            },
            child: Card(
              margin: EdgeInsets.all(paddingSize),
              child: Container(
                height: 100,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: MyText(
                  bottom: paddingSize,
                  text: "Student ID"
                ),
              ),
            ),
          ),

        ]
      )
    );
  }
}