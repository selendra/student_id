class IdentifierModel {

  String? title = '';
  String? frontImage = '';
  String? backImage = '';
  String? frontFaceImage = '';
  String? backFaceImage = '';

  IdentifierModel fromDb(Map<String, dynamic> json){
    title = json['title'];
    frontImage = json['front'];
    backImage = json['back'];
    frontFaceImage = json['front_face'];
    backFaceImage = json['back_face'];
    return this; 
  }

  Map<String, dynamic> toJson(IdentifierModel model){
    return {
      'title': model.title,
      'front': model.frontImage,
      'back': model.backImage,
      'front_face': model.frontFaceImage,
      'back_face': model.backFaceImage
    };
  }
  
}