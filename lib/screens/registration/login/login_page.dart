import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/core/backend.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/registration_p.dart';
import 'package:student_id/screens/identifier/id_card/identifier.dart';
import 'package:student_id/screens/otp_verify/otp_verify_page.dart';
import 'package:student_id/services/storage.dart';

import '../../test_screen_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  bool? isChecked = false;
  bool? checkLogin = true;
  
  final formKey = GlobalKey<FormState>();

  void handleRememberMe(bool? value) async {
    setState(() {
      isChecked = value;
    });
  }

  void validator() {
    final form = formKey.currentState!;

    if (form.validate()) {
      Navigator.pushReplacementNamed(context, verifyRoute);
    }
  }

  void isLogin() async {

    await StorageServices.fetchData(DbKey.login).then((value) {
      print("Login $value");
      if (value != null) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardPage()), (route) => false);
      // if (value != null) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Identifier(title: "",)), (route) => false);
    });

    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ImportAccount()), (route) => false);
    // await Future.delayed(Duration(seconds: 1), (){});
    // Provider.of<ApiProvider>(context, listen: false).initApi(context: context);
    setState(() {
      checkLogin = false;
    });
    // await StorageServices.fetchData("session").then((value) async {
    //   print("Session $value");
    //   if (value != null){

    //     print("Start navigate");
    //     await Navigator.push(
    //       context, 
    //       MaterialPageRoute(builder: (context) => WalletConnectPage())
    //     );
    //   }
    // });
  }

  Future<void> submitLogin() async {
    MyDialog().dialogLoading(context);
    print("submitLogin");
    try {
      // await Future.delayed(Duration(seconds: 1), (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => SetupPage()));
      // });

      await Provider.of<ApiProvider>(context, listen: false).loginSELNetwork(email: emailInputController.text, password: passwordInputController.text).then((value) async {
      
        // Close Dialog
        Navigator.pop(context);

        if (value['status'] == true) {
          
          Provider.of<RegistrationProvider>(context, listen: false).email = emailInputController.text;
          Provider.of<RegistrationProvider>(context, listen: false).password = passwordInputController.text;

          // For OTP
          await Backend().getOtp(emailInputController.text).then((value) async {
            if (value.statusCode == 201){
              await MyDialog().customDialog(context, "Message", "We sent you 4 digit OTP code.\nPlease check your email.");
            }
          });
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPVerifyPage())); 
          return showModalBottomSheet(
              useRootNavigator: true,
              isScrollControlled: true,
              context: context,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              builder: (context) {
                return StatefulBuilder(builder:
                    (context, setModalState) {
                  return  SizedBox(
                    height: MediaQuery.of(context).size.height -200,
                    child: OTPVerifyPage()
                  );
                });
              }
            );
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SetupPage())); 
        } else {
          await MyDialog().customDialog(context, "Message", "${value['message']}");
        }
      });

    } catch (e) {
      debugPrint("Error submitSignUp $e");
      // Navigator.pop(context);
    }
  }

  @override
  void initState() {
    isLogin();
    emailInputController.text = "condaveat@gmail.com";
    passwordInputController.text = "123456";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return checkLogin == false 
    ? TestGlasUI(
      body: LoginPageBody(
        emailInputController: emailInputController,
        passwordInputController: passwordInputController,
        handleRememberMe: handleRememberMe,
        isChecked: isChecked,
        formKey: formKey,
        validator: validator,
        submitLogin: submitLogin
      ),
    ) 
    : const Scaffold(body: Center(
      child: CircularProgressIndicator(),
    ),);
  }
}
