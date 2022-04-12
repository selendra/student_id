import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class OTPVerifyPageBody extends StatelessWidget {
  final TextEditingController verifyInputController;
  final GlobalKey<FormState> formKey;
  final Function(String)? onChanged;
  final Function? validator;

  const OTPVerifyPageBody({ 
    Key? key, 
    required this.verifyInputController,
    required this.formKey,
    this.onChanged,
    this.validator,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    const SizedBox(height: 20),
                    selLogo(context),
                    const SizedBox(height: 20),
                    const Text('Verify',
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
                    VerifyInput(textEditingController: verifyInputController, onChanged: onChanged),
                    const SizedBox(height: 25),
                    SubmitButton(
                      text: 'Verify',
                      onPressed: () {
                        validator!();
                      },
                    ),
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