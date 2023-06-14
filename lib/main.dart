import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firstnum=0;
  int secondnum=0;
  String txttodisplay = '';
  String res='';
  String operatortoperform='0';

  void btnclick(String btnval){
    if(btnval == 'C'){
      txttodisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '0';
    }
    else if(btnval == '+' || btnval == '-' || btnval == '*' || btnval == '/'){
      firstnum = int.parse(txttodisplay);
      res = '';
      operatortoperform = btnval;
    }
    else if(btnval == '='){
      secondnum = int.parse(txttodisplay);
      if(operatortoperform == '+'){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == '-'){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == '*'){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == '/'){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(txttodisplay +btnval).toString();
    }

    setState(() {
      txttodisplay = res;
    });

  }


  Widget custombutton(String btnval){
     return Expanded(
         child: OutlinedButton(
           onPressed: () => btnclick(btnval),
           child: Text('$btnval',
           style: TextStyle(
             fontSize: 25.0,
                 color: Colors.redAccent,
           ),
           ),
         ),
     );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(bottom: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text('$txttodisplay', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600, color: Colors.white),),
                ),
            ),
            Row(
              children: [
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: [
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: [
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('/'),
              ],
            ),
            Row(
              children: [
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('*'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

