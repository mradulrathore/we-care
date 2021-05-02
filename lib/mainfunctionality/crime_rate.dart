import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import '../screens/appBar.dart';


import 'barGraph.dart';

class CrimeRate extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Color(0XFFc2185b),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countryValue="India";
  String stateValue;
  String cityValue;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 600,
      child: Column(
        children: [
          SelectState(
            // style: TextStyle(color: Colors.red),
           
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
              });
            },
            onCityChanged: (value) {
              setState(() {
                cityValue = value;
              });
            },
          ),
          RaisedButton(
            child: Text('Show'),
            onPressed: () {
              //
              setState(() {
                child = myWidget();  
              });
              
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color:  const Color(0XFFFF748C),
            textColor: Colors.white,
          ),
          child==null?Container():child,
          // InkWell(
          //   onTap:(){
          //     print('country selected is $countryValue');
          //     print('country selected is $stateValue');
          //     print('country selected is $cityValue');
          //   },
          //   child: Text(' Check')
          // )
        ],
      ),
    );
  }
  Widget myWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BarChartSample1(),
    );
  }
}
