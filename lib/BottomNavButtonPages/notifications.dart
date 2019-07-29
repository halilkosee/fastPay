import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Bildirim gönderme izni vermediğin için hiç\nbildirimin yok',textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Önemli gelişmeleri sana haber verebilmem\niçin bildirimleri açmak ister misin?',textAlign: TextAlign.center),
                ),
                Center(
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 10),
                      child: new Text(
                        "Bildirimleri Aç",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.blueGrey, width: 0.3),
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
