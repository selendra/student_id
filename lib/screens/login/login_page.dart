import 'package:student_id/all_export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  bool? isChecked = false;
  
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPageBody(
      emailInputController: emailInputController,
      passwordInputController: passwordInputController,
      handleRememberMe: handleRememberMe,
      isChecked: isChecked,
      formKey: formKey,
      validator: validator,
    );
  }
}
