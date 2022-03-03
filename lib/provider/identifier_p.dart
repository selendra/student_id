import 'package:student_id/all_export.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/identifier_m.dart';
import 'package:student_id/services/storage.dart';

class IdentifierProvider extends ChangeNotifier{

  bool? alreadySetup = false;

  IdentifierModel? identifierModel;

  set setSetup(bool value) {
    alreadySetup = true;
    fetchID();
    notifyListeners();
  }

  Future<void> fetchID()async {

    await StorageServices.fetchData(DbKey.idKey).then((value) {
      if (value != null){
        identifierModel = IdentifierModel().fromDb(value);
      }
    });
    notifyListeners();
  }
}