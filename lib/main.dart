import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';
void main() {
  runApp(MaterialApp(home: Hwk2()));
}
class Hwk2 extends StatefulWidget {
  Hwk2State createState() {
    return Hwk2State();
  }
}
class Hwk2State extends State<Hwk2> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String telnumber, pwd;
  late FocusNode phoneFocusNode;
  @override
  void initState() {
    super.initState();
    phoneFocusNode = FocusNode();
  }
  @override
  void dispose() {
// Clean up the focus node when the Form is disposed
    phoneFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    clearTextFields();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Image.asset('images/logo.jpg'), ),
                //Text('Phone Number'),
                TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly ],
                  autofocus: true,
                  focusNode: phoneFocusNode,
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number', hintText: '10-digit only'), ),
                SizedBox(height: 50,),
                TextField(
                  maxLength: 6,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password', hintText: '6-letter only'), ),
                SizedBox(height: 50,),
                ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      setState(() {
                        telnumber = phoneController.text;
                        pwd = passwordController.text;
                        if ((telnumber.length == 10) & (pwd.length == 6)) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return LoginPage(phonein: telnumber, pwdin: pwd);
                          }));
                        }
                        else {
                          return ShowDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Invalid entries'),
                                  content: Text(
                                      'Phone number: 10-digit only; Password: 6-letters only'),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          return Navigator.pop(context, 'OK');
                                        }),
                                  ],
                                );
                              });
                        }
                        ;
                      });
/*
},
}
validation
if (telnumber.length == 6 & int.parse(telnumber))
{
if (pwd.length == 6)
Navigator.of(context).push(MaterialPageRoute(builder: (context)
{
return LoginPage(phonein: telnumber, pwdin: pwd);
}))
}*/
                    })
              ]),
        ));
  }
  void clearTextFields() {
    phoneController.clear();
    passwordController.clear();
//return FocusScope.of(context).requestFocus(phoneFocusNode);
  }
}
