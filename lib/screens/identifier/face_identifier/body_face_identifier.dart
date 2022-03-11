import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/main.dart';
import 'package:student_id/models/identifier_m.dart';

class IdentifierFaceBody extends StatelessWidget {

  final IdentifierModel? model;
  final Function? pickImage;
  final Function? submit;

  const IdentifierFaceBody({ Key? key, this.model, this.pickImage, this.submit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCustom("Natonal ID", context),  
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
                        bottom: paddingSize,
                        text: "Please submit a valid issued ${model!.title}}, with your face"
                      ),

                      MyText(
                        width: 300,
                        bottom: paddingSize,
                        text: "Both Front and Back ${model!.title}."
                      ),

                      // Front
                      model!.frontFaceImage != '' ? MyText(
                        text: "Front"
                      ) : Container(),
                      Card(
                        child: model!.frontFaceImage == '' ? Container(
                          width: 400,
                          height: MediaQuery.of(context).size.width/2.5,
                          child: Image.asset(AppConfig.illusPath+"face.jpg")
                        ) : Image.file(File(model!.frontFaceImage!), height: 200, width: 400),
                      ),

                      // Back
                      model!.backFaceImage != '' ? MyText(
                        text: "Back"
                      ) : Container(),
                      model!.backFaceImage == '' ? Container( ) : Card(child: Image.file(File(model!.backFaceImage!), height: 200, width: 400))
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
                          try {

                            final img = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraApp())) ?? '';
                            if (model!.frontFaceImage == ''){
                              await pickImage!(img, 'front');
                            } else {
                              await pickImage!(img, 'back');
                            }
                          } catch (e){
                            print("Error $e");
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
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          try {

                            final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (model!.frontFaceImage == ''){
                              await pickImage!(image!.path, 'front');
                            } else {
                              await pickImage!(image!.path, 'back');
                            }
                          } catch (e){

                          }
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.upload),
                            MyText(
                              text: "Upload image"
                            )
                          ],
                        )
                      ),
                    ),
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
                onPressed: () async {
                  await submit!();
                }, 
                child: MyText(
                  text: "Submit", color2: Colors.white,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}