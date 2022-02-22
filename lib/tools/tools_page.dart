import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _profileWidget(context),
              const DashboardOptions(),
              const ToolsInfo(),
              AddAssetButton(text: 'Add Services', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          'https://picsum.photos/250?image=9',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
              margin: const EdgeInsets.only(top: 10),
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
        EditButton(
          text: 'Edit',
          onPressed: () {},
        )
      ],
    );
  }
}
