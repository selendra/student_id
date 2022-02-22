import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

// =============================== Reuse Widget ===============================

Widget selLogo(BuildContext context) {
  return Image.asset('assets/logos/sel.png', width: 100, height: 100);
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
