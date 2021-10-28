import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
//define passing variables
  final String phonein, pwdin;
//constructor
  LoginPage({required this.phonein, required this.pwdin});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var credential = [ ['7182234455','abcdef'],['7183456788','ddeeff'],['2129879977','xyzzyz'],
    ['5163658766','rstrrs'] ];

  bool found = false;

  @override
  Widget build(BuildContext context) {
    print('Element 0,0: ' + credential[0][0]);
    for (var j = 0; j < 4; j++) {
      if ((credential[j][0] == widget.phonein) & (credential[j][1] == widget.pwdin)) { found = true;}
    };
    return Scaffold(
      appBar: AppBar(title: Text('Login'), ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: 200,
              height: 100,
              child: Text((() {
                if (found == true)
                  return 'Welcome';
                else
                  return 'Invalid Credentials';
              })(),style: TextStyle(fontSize: 30,),),
            ),
          ),
          ElevatedButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
/*if (found == true) return Container(color: Colors.white, alignment: Alignment.center, width: 100,
height:100, child: Text('Welcome'),);
else return Container(color: Colors.white, alignment: Alignment.center, width: 100,
height:100,child:Text('Invalid credential'));
OR
wrap your statements in a function
(() {
// your code here
}())
*/
  }
}
