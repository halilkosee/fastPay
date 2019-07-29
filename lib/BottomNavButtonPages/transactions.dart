import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<Transaction> {
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
            _hslide(),
          ],
        ),
      ),
    );
  }

  Widget _hslide() {
    {
      final List<String> text = [
        'Fastpay',
        'DENİZBANK HESABIN',
        'BJK BONUS KLSAİK',
        'DENİZ BONUS',
        'NET KART MC',
        'FENERBAHÇE BONUS',
        'TEBBONUS',
        'YAPI KREDİ BANKASI',
        'İstanbul test',
        'İstanbul test',
        'tt',
        ' '
      ];

      return Container(
        color: Colors.indigo,
        height: MediaQuery.of(context).size.width * 0.35,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Card(
                        color: Colors.indigo,
                        semanticContainer: false,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    text[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.0),
                                  ),
                                ),
                              ),
                              Center(
                                child: Image(
                                  image: new AssetImage(
                                      'assets/images/cardbg.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          side:
                          new BorderSide(color: Colors.white70, width: 0.5),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
////////////////////////HARIZONTAL SLIDER AREA END/////////////////////////////////////////////




}