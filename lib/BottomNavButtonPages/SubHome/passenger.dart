import 'package:flutter/material.dart';

class Passanger extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Passanger> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.indigo,
          title: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new Text(
                    'Ulaşım Kartına TL Yükle',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: _passCards(),
      ),
    );
  }
  //////////////////////// PASSENGER CARD AREA BEGIN/////////////////////////////////////////////

  Widget _passCards() {
    final List<String> item = [
      'assets/images/istanbulKartEmpty.png',
      'assets/images/kentkartModal@2x.png',
    ];
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Yükleme yapmak istediğin kartı seç',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Öneriler',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.white,
            //padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    onTap:() {
                    },
                    child: Image(
                      image: new AssetImage(item[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                        Icon(Icons.add_circle_outline, color: Colors.indigo)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Yeni Ulaşım Kartına TL Yükle',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right)),
                  ],
                ),
                onPressed: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    'Geçmiş İşlemler',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
////////////////////////PASSENGER AREA END/////////////////////////////////////////////
}


