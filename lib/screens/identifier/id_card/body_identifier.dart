import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/screens/identifier/face_identifier/face_identifier.dart';

class IdentifierBody extends StatelessWidget {

  final IdentifierModel? model;
  final Function? pickImage;

  const IdentifierBody({ Key? key, this.model, this.pickImage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: model!.title, fontWeight: FontWeight.w600, color2: Colors.white,),
      ),
      body: Stack(
        children: [
          Column(
            children: [

              // Hint To upload Card
              Card(
                margin: EdgeInsets.all(paddingSize),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(paddingSize),
                  child: Column(
                    children: [

                      MyText(
                        width: 300,
                        text: "Please submit a valid issued ${model!.title}.",
                        bottom: paddingSize,
                      ),

                      MyText(
                        width: 300,
                        bottom: paddingSize,
                        text: "Both Front and Back ${model!.title}."
                      ),

                      // Front
                      model!.frontImage != '' ? MyText(
                        text: "Front"
                      ) : Container(),
                      Card(
                        child: model!.frontImage == '' ? Container(
                          width: 400,
                          height: MediaQuery.of(context).size.width/2.5,
                          child: Image.asset(AppConfig.illusPath+"id.jpg")
                        ) : Image.file(File(model!.frontImage!), height: 200, width: 400,),
                      ),

                      // Back
                      model!.frontImage != '' ? MyText(
                        text: "Back"
                      ) : Container(),
                      model!.backImage == '' ? Container() : Card(child: Image.file(File(model!.backImage!), height: 200, width: 400))
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(paddingSize),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          // ImagePicker _picker = ImagePicker();
                          // await _picker.pickImage(source: ImageSource.camera);
                          final img = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraApp())) ?? '';
                          if (model!.frontImage == ''){
                            await pickImage!(img, 'front');
                          } else {
                            await pickImage!(img, 'back');
                          }
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.camera),
                            MyText(
                              text: "Take a photo"
                            )
                          ],
                        )
                      ),
                    ),
                    // Expanded(
                    //   child: TextButton(
                    //     onPressed: () async {
                    //       final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    //       if (model!.frontImage == ''){
                    //         await pickImage!(image!.path, 'front');
                    //       } else {
                    //         await pickImage!(image!.path, 'back');
                    //       }
                    //     }, 
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Icon(Icons.upload),
                    //         MyText(
                    //           text: "Upload image"
                    //         )
                    //       ],
                    //     )
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),

          Positioned(
            left: paddingSize,
            right: paddingSize,
            bottom: paddingSize,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IdentifierFace(model: model,)));
                }, 
                child: MyText(
                  text: "Next", color2: Colors.white,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}