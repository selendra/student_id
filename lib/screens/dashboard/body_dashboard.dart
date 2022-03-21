import 'dart:io';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/identifier/identifier_option.dart';

class DashBoardBody extends StatelessWidget {

  final DashBoardModel? dashModel;
  final IdentifierModel? idModel;
  final Function? edit;
  final Function? pickImage;
  final Function? submitEdit;

  const DashBoardBody({ 
    Key? key, 
    required this.dashModel, 
    required this.idModel, 
    required this.edit, 
    required this.pickImage, 
    required this.submitEdit 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                profileWidget(context, model: dashModel, pickImage: pickImage),
                const DashboardOptions(),
                titleDashboard('Basic Info', context, title2: "Identities"),
                
                PersonlInfo(model: dashModel, edit: edit),
              
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingSize),
                    child: Divider(
                    height: 1,
                    color: Colors.grey
                  )
                ),

                Consumer<IdentifierProvider>(
                  builder: (context, provider, widget){
                    return provider.alreadySetup == true 
                    ? MyText(
                      text: provider.identifierModel!.title, 
                      textAlign: TextAlign.left, 
                      fontWeight: FontWeight.w600,
                      top: paddingSize,
                      left: paddingSize,
                    ) 
                    : Container();
                  }
                ),
                Consumer<IdentifierProvider>(
                  builder: (context, provider, widget){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                      child: provider.alreadySetup == false 
                      ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide()
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                            )
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const IDOption()));
                        }, 
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          alignment: Alignment.center,
                          child: MyText(
                            text: "Setup your ID",
                            fontWeight: FontWeight.w600,
                            color2: Colors.white,
                          )
                        )
                      )
                      : Card(
                        child: Column(
                          children: [
                            Image.file(File(provider.identifierModel!.frontImage!), width: 400, height: 200,)
                          ],
                        ),
                      )
                    );
                  },
                ),

                dashModel!.isEditing == true 
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: (){
                        submitEdit!();
                      }, 
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                          )
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        alignment: Alignment.center,
                        child: MyText(
                          text: "Submit Edit",
                          fontWeight: FontWeight.w600,
                          color2: Colors.white,
                        )
                      )
                    ),
                  )
                ) 
                : Container(),
              ],
            )
          )
        ),
      ),
    );
  }
}