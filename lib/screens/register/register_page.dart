import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/routes/routes.dart' as route;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? _emailInputController;
  TextEditingController? _passwordInputController;

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
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  selLogo(context),
                  const SizedBox(height: 20),
                  const Text('Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  const Text(
                      'One account. One place to manage it all.\n Welcome to you account dashboard.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                  const SizedBox(height: 20),
                  const GoogleBtn(
                    title: 'Register with Google',
                  ),
                  const FacebookBtn(
                    title: 'Register with META',
                  ),
                  divider('or Register with Email'),
                  EmailInput(textEditingController: _emailInputController),
                  PasswordInput(
                      textEditingController: _passwordInputController),
                  SubmitButton(
                    text: 'Submit',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyPage()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Row(
                      children: [
                        const Text('Already have an account?',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        TextButton(
                          child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
