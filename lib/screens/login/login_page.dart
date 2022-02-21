import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/routes/routes.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _emailInputController;
  TextEditingController? _passwordInputController;
  bool? _isChecked = false;

  void _handleRemeberme(bool? value) {
    _isChecked = value;
    setState(() {
      _isChecked = value;
    });
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                  const Text('Login',
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
                    title: 'Login with Google',
                  ),
                  const FacebookBtn(
                    title: 'Login with META',
                  ),
                  divider('or Login with Email'),
                  EmailInput(textEditingController: _emailInputController),
                  PasswordInput(
                      textEditingController: _passwordInputController),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: _isChecked, onChanged: _handleRemeberme),
                            const Text('Remember Me',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                          child: const Text('Forgot Password',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  SubmitButton(
                    text: 'Submit',
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Row(
                      children: [
                        const Text('Don\'t have an account?',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        TextButton(
                          child: const Text('Create New Account',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
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
