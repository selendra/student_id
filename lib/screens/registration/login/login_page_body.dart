import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';

class LoginPageBody extends StatelessWidget {

  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;
  final bool? isChecked;
  final Function? handleRememberMe;
  final GlobalKey<FormState> formKey;
  final Function? validator;
  final Function? submitLogin;

  const LoginPageBody({
    Key? key, 
    required this.emailInputController, 
    required this.passwordInputController, 
    this.handleRememberMe, 
    this.isChecked = false,
    required this.formKey,
    this.validator,
    this.submitLogin
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
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
                    // const FacebookBtn(
                    //   title: 'Login with META',
                    // ),
                    const CustomBtn(
                      title: 'Login with Meta',
                      logo: 'meta.svg',
                    ),
                    const CustomBtn(
                      title: 'Login with Metamask',
                      logo: 'metamask.svg',
                    ),
                    const CustomBtn(
                      title: 'Login with Trust',
                      logo: 'trust.svg',
                    ),
                    const CustomBtn(
                      title: 'Login with Bitriel',
                      logo: 'bitriel.svg',
                    ),
                    divider('or Login with Email'),
                    EmailInput(
                      textEditingController: emailInputController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    PassInput(
                      textEditingController: passwordInputController, 
                      onFieldSubmitted: (){
                        // validator!();
                      },
                    ),
                    SubmitButton(
                      text: 'Submit',
                      onPressed: () async {
                        // validator!();
                        await submitLogin!();
                      },
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, signUpRoute);
                      }, 
                      child: MyText(text: "Account sign up", fontWeight: FontWeight.w600, color2: Colors.blue,)
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