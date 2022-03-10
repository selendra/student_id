import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/provider/identifier_p.dart';
import 'package:student_id/screens/identifier/id_card/body_identifier.dart';
import 'package:student_id/screens/identifier/face_identifier/body_face_identifier.dart';
import 'package:student_id/services/storage.dart';

class IdentifierFace extends StatefulWidget {
  final IdentifierModel? model;
  const IdentifierFace({ Key? key, this.model}) : super(key: key);

  @override
  _IdentifierState createState() => _IdentifierState();
}

class _IdentifierState extends State<IdentifierFace> {

  Future pickImage(String? img, String? label) async {

    try {
      if (label == 'back'){
        widget.model!.backFaceImage = img;
      } else {
        
        widget.model!.frontFaceImage = img;
      }
      setState(() {
        
      });
    } catch (e){
      print("Error pickImage $e");
    }
  }

  Future<void> submit() async{
    
    MyDialog().dialogLoading(context);
    await Future.delayed( const Duration(seconds: 1), () async {

      await StorageServices.storeData(IdentifierModel().toJson(widget.model!), DbKey.idKey);
      
      Provider.of<IdentifierProvider>(context, listen: false).setSetup = true;

      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => const Navbar()), 
        (route) => false
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IdentifierFaceBody(model: widget.model, pickImage: pickImage, submit: submit);
  }
}