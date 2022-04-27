import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/core/backend.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/sign_up_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/provider/registration_p.dart';
import 'package:student_id/screens/otp_verify/otp_verify_page.dart';
import 'package:student_id/screens/registration/login/body_login_page.dart';
import 'package:student_id/screens/registration/signup/body_signup.dart';
import 'package:student_id/screens/registration/verfiyAcc/verifyAcc.dart';
import 'package:student_id/services/storage.dart';

import '../../test_screen_ui.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpModel _signUpModel = SignUpModel();
  bool? isChecked = false;
  
  final formKey = GlobalKey<FormState>();

  String? _msg;
  
  RegistrationProvider? _registrationProvider;

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

  Future<void> submitSignUp() async {

    MyDialog().dialogLoading(context);
    try {

      // await Future.delayed(Duration(seconds: 1), (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPage()));
      // });

      await Provider.of<ApiProvider>(context, listen: false).registerSELNetwork(email: _signUpModel.emailInputController.text, password: _signUpModel.conPasController.text).then((value) async {
        
        // Assign User Data
        _registrationProvider!.usrName = _signUpModel.userNameController.text;
        _registrationProvider!.email = _signUpModel.emailInputController.text;
        _registrationProvider!.password = _signUpModel.conPasController.text;

        // Close Dialog
        Navigator.pop(context);

        if (value['status'] == true) {
          await Backend().getOtp(_signUpModel.emailInputController.text).then((otpMsg) async {
            if (value.statusCode == 201){
              await MyDialog().customDialog(context, "${value['message']}", "We sent you 4 digit OTP code.\nPlease check your email.");
            }
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerifyPage()));
        } else {
          await MyDialog().customDialog(context, "Message", "${value['message']}");
        }
      });

      // await Backend().register(_signUpModel).then((value) async {
      //   print("value ${value.body} ");
      //   dynamic decode = json.decode(value.body);
      //   Navigator.pop(context);
      //   if (value.statusCode == 200){
      //     await MyDialog().customDialog(context, "Message", "${decode['message']}");
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyAcc(signUpModel: _signUpModel)));
      //   } else {
      //     await MyDialog().customDialog(context, "Oops", "${decode['message']}");

      //   }

      // });

    } catch (e) {
      print("Error submitSignUp $e");
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    _signUpModel.userNameController.text = "Rithy THUL";
    _signUpModel.emailInputController.text = "rithythul@gmail.com";
    _signUpModel.passwordInputController.text = "123456";
    _signUpModel.conPasController.text = "123456";
    _registrationProvider = Provider.of<RegistrationProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TestGlasUI(
      body: SignUpPageBody(
        signUpModel: _signUpModel,
        handleRememberMe: handleRememberMe,
        isChecked: isChecked,
        formKey: formKey,
        validator: validator,
        submitSignUp: submitSignUp
      ),
    );
  }
}
