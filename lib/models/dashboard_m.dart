import 'package:student_id/all_export.dart';

class DashBoardModel {
  
  String profile = 'https://images.unsplash.com/photo-1597466765990-64ad1c35dafc';
  String cover = 'https://avatars.githubusercontent.com/u/49308834?s=200&v=4';

  String name = '';
  String email = '';
  String dob = '';
  String nationality = '';
  String phoneNum = '';
  String country = '';
  bool isEditing = false;
  bool isInit = false;

  String titlePage = "Basic Info";
  String wallet = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalController = TextEditingController();

  initData(){

    name = "None";
    email = "None";
    nationality = "None";
    phoneNum = "None";
    nameController.text = "None";
    
    emailController.text = "None";
    nationalityController.text = "None";
    phoneNumController.text = "None";
    isInit = true;
  }

}