import 'package:flutter/material.dart';

class Opportunities extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<Opportunities> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[

            _getallopportunuties(),
          ],
        ),
      ),
    );
  }


  ////////////////////////OPPORTUNITIES AREA BEGIN/////////////////////////////////////////////
  Widget _getallopportunuties() {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
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
}
