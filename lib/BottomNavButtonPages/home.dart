import 'package:flutter/material.dart';
import 'package:fastpay/FastPoints/map.dart';
import 'package:fastpay/BottomNavButtonPages/SubHome/passenger.dart';

class HomePage extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _banner(),
                _hslide(),
                _getallopportunuties(),
                _clues(),
              ],
            ),
            Positioned(
              top: 325,
              child: _getCards(),
            ),
          ],
        ),
      ),
    );
  }

////////////////////////BANNER AREA BEGIN/////////////////////////////////////////////
  Widget _banner() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      color: Colors.indigo,
      child: Container(
        color: Colors.indigoAccent,
        child: Stack(
          children: <Widget>[
            Image(
                image: new AssetImage('assets/images/a1012.png'),
                fit: BoxFit.cover),
            Positioned(
              left: 50.0,
              right: 50.0,
              bottom: 50.0,
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "A101'de fastPay'le öde,",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '10 TL + %10 iade cebinde!',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    //height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      onPressed: () {},
                      child: new Text(
                        "Odemeni Yap",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                      shape: new RoundedRectangleBorder(
                        side:
                        new BorderSide(color: Colors.redAccent, width: 0.1),
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
////////////////////////BANNER AREA END/////////////////////////////////////////////

////////////////////////CARDS AREA BEGIN/////////////////////////////////////////////
  Widget _getCards() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hızlı İşlemlerin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Düzenle",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            _card('Ode/Yükle', 'assets/icons/odeYukle.png', 1),
            _card('Para Gönder', 'assets/icons/paraGonder.png', 2),
          ],
        ),
        Row(
          children: <Widget>[
            _card(
                'Ulaşım Kartına Tl Yükle', 'assets/icons/istanbulCard.png', 3),
            _card('İşyeri Ödemesi Yap', 'assets/icons/uyeIsYeri.png', 4),
          ],
        ),
        Row(
          children: <Widget>[
            _card('En Yakın fastNokta', 'assets/icons/fastNoktaPin.png', 5),
            _card('Oyun Kodu Satın Al', 'assets/icons/oyunKodu.png', 6),
          ],
        ),
      ],
    );
  }

  void _goto(int item) {
    setState(
          () {
        switch (item) {
          case 3:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Passanger()),
              );
              break;
            }
          case 5:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FastPoints()),
              );
              break;
            }
        }
      },
    );
  }

  Widget _card(String title, String icon, int item) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.49,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          child: InkWell(
            onTap: () {
              _goto(item);
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: new AssetImage(icon),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
////////////////////////CARDS AREA END/////////////////////////////////////////////

////////////////////////HARIZONTAL SLIDER AREA BEGIN/////////////////////////////////////////////

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
        height: MediaQuery.of(context).size.width * 0.50,
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

////////////////////////OPPORTUNITIES AREA BEGIN/////////////////////////////////////////////
  Widget _getallopportunuties() {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 300,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Senin İçin Seçtiklerim",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        _getopportunute('assets/images/opportunities/o12.png'),
        _getopportunute('assets/images/opportunities/o22.png'),
        _getopportunute('assets/images/opportunities/o32.png'),
        _getopportunute('assets/images/opportunities/o42.png'),
      ],
    );
  }

  Widget _getopportunute(String image) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image(
        image: new AssetImage(image),
      ),
    );
  }
////////////////////////OPPORTUNITIES AREA END/////////////////////////////////////////////

////////////////////////CLUES AREA BEGIN/////////////////////////////////////////////

  Widget _clues() {
    final List<Color> bg = [
      Colors.indigo,
      Colors.orange,
    ];
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  margin: EdgeInsets.all(10),
                  color: bg[index],
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              );
            },
          ),
        ),
        RaisedButton(
          color: Colors.white,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: new Text(
              "Tüm Fırsatlar",
              style: TextStyle(fontSize: 16.0, color: Colors.red),
            ),
          ),
          shape: new RoundedRectangleBorder(
            side: new BorderSide(color: Colors.blueGrey, width: 0.3),
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ],
    );
  }
////////////////////////CLUES AREA END/////////////////////////////////////////////

}
