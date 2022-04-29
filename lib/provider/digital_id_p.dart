import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/digital_id_m.dart';
import 'package:student_id/provider/home_p.dart';
import 'package:student_id/services/storage.dart';

class DigitalIDProvider extends ChangeNotifier{

  DigitalIDModel? identifierModel = DigitalIDModel();

  Map<String, dynamic>? _dataToBlockchain = {};
  
  Map<String, dynamic> get blochainData => _dataToBlockchain!;

  set setSetup(bool value) {
    fetchID();
    notifyListeners();
  }

  Future<void> fetchID()async {

    await StorageServices.fetchData(DbKey.idKey).then((value) {
      if (value != null){
        identifierModel = DigitalIDModel().fromDb(value);
        print("value ${value}");
        print(identifierModel!.lsIDCard);
      }
    });
    notifyListeners();
  }

  bool isAbleSubmitToBlockchain({required BuildContext? context}){
    try {

      HomeProvider _api = Provider.of(context!, listen: false);
      print("identifierModel!.backImage ${identifierModel!.backImage ?? 'fuck'}");
      print("identifierModel!.frontImage ${identifierModel!.frontImage}");
      print("identifierModel!.selfieImage ${identifierModel!.selfieImage}");
      print("_api.homeModel.email ${_api.homeModel.email}");
      print("_api.homeModel.country ${_api.homeModel.country}");
      print("_api.homeModel.dob ${_api.homeModel.dob}");
      print("_api.homeModel.name ${_api.homeModel.name}");
      print("_api.homeModel.nationality ${_api.homeModel.nationality}");
      print("_api.homeModel.phoneNum ${_api.homeModel.phoneNum}");
      print("_api.homeModel.cover ${_api.homeModel.cover}");
      print("_api.homeModel.profile ${_api.homeModel.profile}");
      if (
        identifierModel!.backImage != "" &&
        identifierModel!.frontImage != ""&&
        identifierModel!.selfieImage != "" &&
        _api.homeModel.email != "" &&
        _api.homeModel.country != "" &&
        _api.homeModel.dob != "" &&
        _api.homeModel.name != "" &&
        _api.homeModel.nationality != "" &&
        _api.homeModel.phoneNum != "" &&
        _api.homeModel.cover != "" &&
        _api.homeModel.profile != ""
      ){
        _dataToBlockchain = {
          "backImage": identifierModel!.backImage,
          "frontImage": identifierModel!.frontImage,
          "selfieImage": identifierModel!.selfieImage,
          "email": _api.homeModel.email,
          "country": _api.homeModel.country,
          "dob": _api.homeModel.dob,
          "name": _api.homeModel.name,
          "nationality": _api.homeModel.nationality,
          "phoneNum": _api.homeModel.phoneNum,
          "cover": _api.homeModel.cover,
          "profile": _api.homeModel.profile
        };
        
        Provider.of<HomeProvider>(context, listen: false).readyToSubmit = true;
        print("finish finish");
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Error isAbleSubmitToBlockchain $e");
    }
    notifyListeners();
    return false;
  }

  void notify(){
    notifyListeners();
  }
}