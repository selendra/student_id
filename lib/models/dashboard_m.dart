import 'package:student_id/all_export.dart';

class DashBoardModel {
  
  String profile = 'https://images.unsplash.com/photo-1597466765990-64ad1c35dafc';
  String cover = 'https://picsum.photos/250?image=9';

  String name = '';
  String email = '';
  String nationality = '';
  String phoneNum = '';
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

}