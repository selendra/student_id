import 'package:student_id/all_export.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeProvider with ChangeNotifier{

  DashBoardModel homeModel = DashBoardModel();
  IO.Socket? socket;

  bool successSubmitToBlockchain = false;
  bool readyToSubmit = false;

  set setWallet(String value) {
    homeModel.wallet = value;
    // notifyListeners();
  }

  set setSuccessSubmitToBlockchain(bool value) {
    successSubmitToBlockchain = value;
    notifyListeners();
  }

  HomeProvider(){
    if(homeModel.isInit == false) homeModel.initData();
    notifyListeners();
  }
  // 'http://137.184.224.174:4000'
  Future<void> connectWS(String email, { required BuildContext? context}) async{ 
    print("connectWS");
    try{
      socket = IO.io(
        'https://auth-student.selendra.org/', 
        IO.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .setExtraHeaders({'authorization': 'dummytoken'}) // optional
        .build()
      );

      socket!.onConnect((data) {
        print('connected');
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Connected'),
        ));
        socket!.emit("/auth/qr-scan", {"id": email});
      });
      socket!.onConnectError((data) {
        print("onConnectError $data");
      });
      socket!.onError((data) {
        print("onError $data");
      });
      socket!.connect();

    } catch (e) {
      print("Error connectWS $e");
    }
  }

  void submitEdit(DashBoardModel model){

    homeModel.email = model.emailController.text;
    homeModel.country = model.country;
    homeModel.dob = model.dob;
    homeModel.name = model.nameController.text;
    homeModel.nationality = model.nationalityController.text;
    homeModel.phoneNum = model.phoneNumController.text;
    homeModel.cover = model.cover;  
    homeModel.profile = model.profile;
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }
}