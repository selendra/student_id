import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:image_picker/image_picker.dart';

class Components {
  
  Future<void> imageOption({
    @required BuildContext? context, 
    @required Function? getImage, 
    /// For Which Image Section That Need to Pick Image
    String? label
  }) async {
    final selected = await showModalBottomSheet(
      context: context!, 
      builder: (context){
        return Container(
          height: 140,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context, "camera");
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: MyText(text: "Camera", color2: Colors.black, fontWeight: FontWeight.w600)
                  )
                )
              ),
              Divider(
                thickness: 0.2,
                color: Colors.black54.withOpacity(0.7),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context, "gallery");
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: MyText(text: 'gallery', color2: Colors.black, fontWeight: FontWeight.w600)
                  )
                )
              )
            ],
          ),
        );
      }
    );

    if (selected == 'camera'){
      label == null ? await getImage!(ImageSource.camera) : await getImage!(ImageSource.camera, label);
    } else if (selected == 'gallery'){
      label == null ? await getImage!(ImageSource.gallery) : await getImage!(ImageSource.gallery, label);
    }
  }
}