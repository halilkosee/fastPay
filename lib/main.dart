import 'package:flutter/material.dart';
import 'package:fastpay/BottomNavButtonPages/home.dart';
import 'package:fastpay/BottomNavButtonPages/opportunities.dart';
import 'package:fastpay/BottomNavButtonPages/transactions.dart';
import 'package:fastpay/BottomNavButtonPages/notifications.dart';
import 'package:fastpay/BottomNavButtonPages/profile.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'fastPay'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static Widget lg(String path) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image(
        image: new AssetImage(path),
      ),
    );
  }

  static Widget tt(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(title),
    );
  }


  Widget widgetForBody = HomePage();
  Widget holder = lg('assets/images/logo.png');
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(
          () {
        switch (_selectedIndex = index) {
          case 0:
            {
              widgetForBody = HomePage();
              which = lg('assets/images/logo.png');
            }
            break;
          case 1:
            {
              which = tt('Fırsatlar');
              widgetForBody = Opportunities();
            }
            break;
          case 2:
            {
              which = tt('İşlemler');
              widgetForBody = Transaction();
            }
            break;
          case 3:
            {
              which = tt('Bildirimler');
              widgetForBody = Notifications();

            }
            break;
          case 4:
            {
              which = tt('Hesabım');
              widgetForBody = Profile();
            }
            break;
        }
      },
    );
  }

  Widget which = lg('assets/images/logo.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: true,
        backgroundColor: Colors.indigo,
        title: Center(child: which),
      ),
      body: widgetForBody,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'ANA SAYFA',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'FIRSATLAR',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: Text(
              'İŞLEMLER',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(
              'BİLDİRİMLER',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'PROFİLİM',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
