import 'package:flutter/material.dart';

import '../screens/appBar.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFF5B16D0);

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.favorite, 'LIKE'),
          _buildButtonColumn(color, Icons.near_me, 'SHARE'),
          _buildButtonColumn(color, Icons.shopping_cart_rounded, 'BUY'),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppLogo(),
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Color(0xFF5B16D0),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/comb-knife.PNG',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Hidden Comb Knife',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[900],
                  ),
                  Text('100'),
                ],
              ),
            ),
            buttonSection,
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/images/pepper-spray.PNG',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Pepper Spray',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text('41'),
                ],
              ),
            ),
            buttonSection,
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/images/safety-ring.PNG',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Safety Rings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text('52'),
                ],
              ),
            ),
            buttonSection,
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/images/keychain.PNG',
              width: 600,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Self defence toothpick',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text('80'),
                ],
              ),
            ),
            buttonSection,
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
