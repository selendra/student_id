import 'package:image_picker/image_picker.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/camera_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/screens/identifier/id_card/body_identifier.dart';

class Identifier extends StatefulWidget {

  final String? title;

  const Identifier({ Key? key, this.title }) : super(key: key);

  @override
  _IdentifierState createState() => _IdentifierState();
}

class _IdentifierState extends State<Identifier> {

  IdentifierModel model = IdentifierModel();
  
  Future pickImage(String? img, String? label) async {

    try {
      if (label == 'back'){
        model.backImage = img;
      } else {
        
        model.frontImage = img;
      }
      setState(() { });
    } catch (e){
      print("Error pickImage $e");
    }
  }
  @override
  void initState() {
    model.title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IdentifierBody(model: model, pickImage: pickImage);
  }
}