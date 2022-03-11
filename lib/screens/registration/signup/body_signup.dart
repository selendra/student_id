import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';
import 'package:student_id/models/sign_up_m.dart';

class SignUpPageBody extends StatelessWidget {

  final SignUpModel? signUpModel;
  final bool? isChecked;
  final Function? handleRememberMe;
  final GlobalKey<FormState> formKey;
  final Function? validator;
  final Function? submitSignUp;

  const SignUpPageBody({
    Key? key, 
    this.signUpModel,
    this.handleRememberMe, 
    this.isChecked = false,
    required this.formKey,
    this.validator,
    this.submitSignUp
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    selLogo(context),
                    const SizedBox(height: 20),
                    const Text('Sign Up',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'One account. One place to manage it all.\n Welcome to you account dashboard.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      )
                    ),
                    const SizedBox(height: 20),
                    const GoogleBtn(
                      title: 'Login with Google',
                    ),
                    // const FacebookBtn(
                    //   title: 'Login with META',
                    // ),
                    const CustomBtn(
                      title: 'Login with Meta',
                      logo: 'meta.svg',
                    ),
                    divider('or Sign up with Email'),
                    MyInput(
                      label: 'Full name',
                      textEditingController: signUpModel!.userNameController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                      validator: (String? value){

                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if ( value.length < 6) {
                          return "Password less than 6 digit";
                        }

                        // the email is valid
                        return null;
                      },
                    ),
                    EmailInput(
                      textEditingController: signUpModel!.emailInputController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    PassInput(
                      label: "Password",
                      textEditingController: signUpModel!.passwordInputController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    PassInput(
                      label: "Confirm password",
                      textEditingController: signUpModel!.conPasController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                      validator: (String? value){

                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if ( value.length < 6) {
                          return "Password less than 6 digit";
                        }

                        // the password is valid
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(
                      text: 'Submit',
                      onPressed: () async {
                        await submitSignUp!();
                      },
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, loginRoute);
                      }, 
                      child: MyText(text: "Account login", fontWeight: FontWeight.w600, color2: Colors.blue,)
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}