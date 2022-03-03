import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_id/all_export.dart';

class CreateKeyBody extends StatelessWidget {
  final bool initial;
  final String seed;
  final Function() generateKey;

  const CreateKeyBody({Key? key, required this.initial, required this.seed, required this.generateKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    var correctHeight = height - padding.top - padding.bottom;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? correctHeight
                : MediaQuery.of(context).size.height * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: PeerProgress(1),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Generate random 12 words',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: blackColor),
                                        ),
                                        Text(
                                          'Setup Your Secure Phassphrase',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: blackColor),
                                        ),
                                        Text(
                                          'Write down the following words in order and keep them somewhere safe. Anyone with access to it will also have access to your account! You will be asked to verify your passphrase next. Passphrase also known mnemonic. ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: blackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                          'Copied to clipboard',
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(seconds: 1),
                                      ));
                                      Clipboard.setData(
                                        ClipboardData(text: seed),
                                      );
                                    },
                                    child: Container(
                                      // height: 250,
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 32, 16, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        color: whiteColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: getColumn(seed, 0),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: getColumn(seed, 1),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: getColumn(seed, 2),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            margin: const EdgeInsets.all(4),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomButtonIcon(
                                                    onPressed: () async => {
                                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                        content: Text(
                                                          'Copied to clipboard',
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        duration: Duration(seconds: 1),
                                                      )),
                                                      Clipboard.setData(
                                                        ClipboardData(text: seed),
                                                      ),
                                                    },
                                                    text: 'Copy',
                                                    colorBtn: primaryColor.withOpacity(0.17),
                                                    colorText: primaryColor,
                                                    icon: Icon(Icons.copy_all_outlined, color: primaryColor),
                                                  ),
                                                  CustomButtonIcon(
                                                    onPressed: () async => {
                                                      generateKey(),
                                                    },
                                                    text: 'Generate New',
                                                    colorBtn: primaryColor.withOpacity(0.17),
                                                    colorText: primaryColor,
                                                    icon: Icon(Icons.refresh_outlined, color: primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomButton(
                    onPressed: () async => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyPassphrase(),
                        ),
                      ),
                    },
                    text: 'Continue',
                    colorBtn: primaryColor,
                    colorText: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getColumn(String seed, int pos) {
    var list = <Widget>[];
    var se = seed.split(' ');
    var colSize = se.length ~/ 3;

    for (var i = 0; i < colSize; i++) {
      list.add(Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        // color: grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: i * 3 + pos + 1 < 10
              ? Text(
                  '  ' + (i * 3 + pos + 1).toString() + '.  ' + se[i * 3 + pos],
                  style: TextStyle(color: blackColor, fontSize: 14),
                )
              : Text(
                  (i * 3 + pos + 1).toString() + '.  ' + se[i * 3 + pos],
                  style: TextStyle(color: blackColor, fontSize: 14),
                ),
        ),
      ));
    }
    return list;
  }
}
