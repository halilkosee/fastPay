import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child:Column(
          children: <Widget>[
            Center(child: Text('Hesabım',),),
          ],
        ),
      ),
    );
  }
}