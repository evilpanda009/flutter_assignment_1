import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/counter.dart';


class endScreen extends StatefulWidget {
  const endScreen({Key? key}) : super(key: key);

  @override
  _endScreenState createState() => _endScreenState();
}

class _endScreenState extends State<endScreen> {

  List<String> msg = [
    ' We are sorry for your inconvenience.',
    ' Hope we serve you better next time.',
    'We hope you come back next time!'
  ];
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Counter;

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback App'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Thank you for your feedback!',
          style: TextStyle(
            fontSize: 20,
            color: args.score < 10 ? Colors.redAccent : (args.score < 20 ? Colors.yellow[700] : Colors.green),
          ),),
          Text(args.score < 10 ? msg[0] : (args.score < 20 ? msg[1] : msg[2])
          ,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30 ,

            color: args.score < 10 ? Colors.redAccent : (args.score < 20 ? Colors.yellow[700] : Colors.green)
          ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/', arguments: Counter(0));
            },
              child: Text('Reset'),
          ),

        ],
        ),
      ) ,
    );
  }
}
