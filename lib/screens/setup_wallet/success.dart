import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/theme/theme.dart';

class SuccessSubmit extends StatelessWidget{

  final Function? method;

  SuccessSubmit({this.method});

  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  MyText(
                    top: paddingSize,
                    bottom: paddingSize,
                    text: "Success",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),

                  MyText(
                    top: paddingSize,
                    bottom: paddingSize,
                    left: paddingSize*2,
                    right: paddingSize*2,
                    text: "The entered recovery seeds is valid and matches the one in devices.",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),

                  Image.asset(AppConfig.illusPath+"illus_3d.png"),

                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(paddingSize),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(HexColor(AppColors.primary))
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                      width: MediaQuery.of(context).size.width,
                      child: MyText(
                        text: 'Finish',
                        color2: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (method != null) {
                        await method!();
                      } else {

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardPage()), (route) => false);
                      }
                    },
                  ),
                ),
              )
            ]
          ),
        )
      )
    );
  }
}