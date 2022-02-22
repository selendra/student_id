import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';


class PhraseInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  const PhraseInput({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 8,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textEditingController,
        onChanged: (value) {
          //Do something wi
        },
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white, 
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  const EmailInput({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                //Do something wi
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                label: const Text("Email"),
                labelStyle: const TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final TextEditingController? textEditingController;

  const PasswordInput({required this.textEditingController, Key? key})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: true,
        decoration: InputDecoration(
          label: const Text("Password"),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }
}

class VerifyInput extends StatefulWidget {
  final TextEditingController? textEditingController;

  const VerifyInput({required this.textEditingController, Key? key})
      : super(key: key);

  @override
  State<VerifyInput> createState() => _VerifyInputState();
}

class _VerifyInputState extends State<VerifyInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: true,
        decoration: InputDecoration(
          label: const Text("Verify"),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }
}

// =============================== Social Media Button ===============================
class GoogleBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const GoogleBtn({
    this.onPressed,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/google-icon.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              Text(title!,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}

class FacebookBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  const FacebookBtn({
    this.onPressed,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/meta-icon.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              Text(title!,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}

class SubmitButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const SubmitButton({this.text, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 50;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: primaryColor),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(top: 15, bottom: 15)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius)),
                  )),
              onPressed: onPressed,
              child: Text(
                text!,
                style: const TextStyle(color: accentColor, fontSize: 16),
              ),
            )),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const EditButton({this.text, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 50;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 20,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: primaryColor,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: const TextStyle(color: accentColor, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class DashboardOptions extends StatelessWidget {
  const DashboardOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.people_alt_outlined),
                iconSize: 40,
                color: greyColor,
              ),
              Text(
                'Verify',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_2_outlined),
                iconSize: 40,
                color: greyColor,
              ),
              Text(
                'QR Code',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                iconSize: 40,
                color: greyColor,
              ),
              Text(
                'Share',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PersonlInfo extends StatelessWidget {
  const PersonlInfo({Key? key}) : super(key: key);

  Widget _nameInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Name', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _emailInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Email', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _countryInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Country', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _phoneNumberInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Phone Number', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Personal', context),
        _nameInfo('Rithy Thul'),
        _emailInfo('rithythul@gmail.com'),
        _countryInfo('Cambodia'),
        _phoneNumberInfo('+855-77-202-202')
      ],
    );
  }
}

class LinkedAccountInfo extends StatelessWidget {
  const LinkedAccountInfo({Key? key}) : super(key: key);

  Widget _moodleInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Moodle', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _wordpressInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Wordpress', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _koompiLTEInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('KOOMPI LTE', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _twitterInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Twitter', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _googleInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Google', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  Widget _facebookInfo(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Facebook', style: TextStyle(color: greyColor)),
            Text(text!,
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w700)),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Linked Social Media', context),
        _moodleInfo('ebc.kh, kru.org'),
        _wordpressInfo('moc.gov.kh, moh.gov.kh'),
        _koompiLTEInfo('Unbounded'),
        _twitterInfo('Unbounded'),
        _googleInfo('Unbounded'),
        _facebookInfo('Unbounded'),
      ],
    );
  }
}

class CryptosAssetInfo extends StatelessWidget {
  const CryptosAssetInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fiat = TextEditingController(text: '2,000,000');
    TextEditingController btc = TextEditingController(text: '1 BTC');
    TextEditingController eth = TextEditingController(text: '0.001 ETH');
    TextEditingController sel = TextEditingController(text: '500 SEL');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Cryptos Assets', context),
        getBalanceBox('Fiat: Khmer Riel (KHR), USD', fiat, context),
        getBalanceBox('Bitcoin (BTC)', btc, context),
        getBalanceBox('Ethereum (ETH)', eth, context),
        getBalanceBox('Selendra (SEL', sel, context),
      ],
    );
  }
}

class StoragesInfo extends StatelessWidget {
  const StoragesInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Content Storages', context),
      ],
    );
  }
}

class ToolsInfo extends StatelessWidget {
  const ToolsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleDashboard('Tools', context),
      ],
    );
  }
}

class AddAssetButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const AddAssetButton({this.text, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HexColor primaryColor = HexColor('#00AAFF');
    const accentColor = Color(0xffffffff);

    const double borderRadius = 4;

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 70, right: 70),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: primaryColor),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(top: 15, bottom: 15)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius)),
                  )),
              onPressed: onPressed,
              child: Text(
                text!,
                style: const TextStyle(color: accentColor, fontSize: 16),
              ),
            )),
      ),
    );
  }
}
