import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

// =============================== Reuse Widget ===============================
void showAlertDialog(TextEditingController phraseKey, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: HexColor('#EDEDED'),
        content: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 2.2,
          decoration: const BoxDecoration(
            color: Color(0x00ffffff),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Social Wallets",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                "Generate Private/Public Key with close friends’ contacts; phone numbers and/or email addresses and/or names.\nA secure key to everything yours, make sure you save or remember it well",
                style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              const Text(
                "12 words* separated by space",
                style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              PhraseInput(textEditingController: phraseKey),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
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
                                borderRadius: BorderRadius.circular(50)),
                          )),
                      onPressed: (){},
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}


Widget selLogo(BuildContext context) {
  return Image.asset('assets/logos/sel.png', width: 100, height: 100);
}

Widget profileWidget(BuildContext context) {
  return Stack(
    children: <Widget>[
      Image.network(
        'https://picsum.photos/250?image=9',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: (MediaQuery.of(context).size.width),
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1597466765990-64ad1c35dafc',
                  height: 110,
                  width: 110,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                'Selena',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      
      Positioned(
        right: 10,
        top: 10,
        child: EditButton(
          text: 'Edit',
          onPressed: () {},
        )
      )
    ],
  );
}

Widget divider(String title) {
  return Container(
    color: Colors.white,
    child: Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      Text(title, style: const TextStyle(color: Colors.grey)),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]),
  );
}

Widget titleDashboard(String title, BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
    width: MediaQuery.of(context).size.width,
    color: greyBackgroundColor,
    child: Text(title,
        style: TextStyle(color: greyColor, fontWeight: FontWeight.w700)),
  );
}

Widget getBalanceBox(
    String title, TextEditingController? data, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 70, right: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(color: greyColor, fontWeight: FontWeight.w700)),
        Container(
          color: greyBackgroundColor,
          child: TextField(
            readOnly: true,
            enabled: false,
            controller: data!,
            style: const TextStyle(fontWeight: FontWeight.w700),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
