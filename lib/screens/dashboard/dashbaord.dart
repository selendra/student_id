import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/models/dashboard_m.dart';
import 'package:student_id/provider/api_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  TextEditingController phraseKey = TextEditingController();
  DashBoardModel dashBoardM = DashBoardModel();

  Future pickImage(ImageSource source, String? label) async {

    final pickedFile = await ImagePicker.platform.pickImage(source: source);
    
    if (pickedFile != null){
      setState(() {
        if (label == 'cover'){
          dashBoardM.cover = pickedFile.path;
        } else {

          dashBoardM.profile = pickedFile.path;
        }
      });
    }
  }
  
  void edit(){
    setState(() {
      dashBoardM.isEditing = !dashBoardM.isEditing;
      if (dashBoardM.isEditing == false) resetEdit();
    });
  }

  void resetEdit(){
    setState(() {
      
      dashBoardM.nameController.text = dashBoardM.name;
      dashBoardM.emailController.text = dashBoardM.email;
      dashBoardM.nationalityController.text = dashBoardM.nationality;
      dashBoardM.phoneNumController.text = dashBoardM.phoneNum;
    });
  }

  void btn()async {

    await Provider.of<ApiProvider>(context, listen: false).addAcc(context: context);
  }

  @override
  void initState() {
    dashBoardM.name = "Rithy THUL";
    dashBoardM.email = "rithythul@gmail.com";
    dashBoardM.nationality = "Cambodia";
    dashBoardM.phoneNum = "+855-77-202-202";

    dashBoardM.nameController.text = "Rithy THUL";
    dashBoardM.emailController.text = "rithythul@gmail.com";
    dashBoardM.nationalityController.text = "Cambodia";
    dashBoardM.phoneNumController.text = "+855-77-202-202";
    ApiProvider().initApi(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profileWidget(context, model: dashBoardM, pickImage: pickImage),
              const DashboardOptions(),
              titleDashboard('Personal', context),
              PersonlInfo(model: dashBoardM, edit: edit),

              dashBoardM.isEditing == true ? Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){
                    dashBoardM.name = dashBoardM.nameController.text;
                    dashBoardM.email = dashBoardM.emailController.text;
                    dashBoardM.nationality = dashBoardM.nationalityController.text;
                    dashBoardM.phoneNum = dashBoardM.phoneNumController.text;
                    dashBoardM.isEditing = false;

                    setState(() {
                      
                    });
                  }, 
                  child: MyText(text: "Submit", color2: Colors.white, width: MediaQuery.of(context).size.width / 2,)
                ),
              )
              : Container()
            ],
          ),
        ),
      ),
    );
  }
}
