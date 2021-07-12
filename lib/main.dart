


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/counter.dart';
import 'package:flutter_app/endScreen.dart';

void main() => runApp(MaterialApp(

  routes: {
    '/': (context) => FeedbackApp(),
    '/end': (context) => endScreen(),

  },
));

class FeedbackApp extends StatefulWidget {

  @override
  _FeedbackAppState createState() => _FeedbackAppState();
}



class _FeedbackAppState extends State<FeedbackApp> {
  List<String> Questions = ["Did you enjoy your experience?", "Were your problems handled smoothly?",
    "How was the staff?",
    "Do you think you got a value for your money?",
    "Rate your overall experience",
    "How likely are you to recommend our service to others?"];

  int counter = 0;
  int rating = 0;
  int ratingSum = 0;
   Color col = Colors.redAccent;
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback App'),
      ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,250,20,20),
          child: Column(

            children: <Widget>[
              Text(Questions[counter],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                ),
              ),
              SizedBox(height: 25.0),
              Slider(

                activeColor: col,
                value: rating.toDouble(),
                onChanged: (newValue){
                  setState(() {
                    rating = newValue.toInt();
                    col = (rating < 2 ? Colors.redAccent : (rating < 4 ? Colors.yellow[700]! : Colors.green!));
                  });
                },
                min: 0,
                max: 5,
                divisions: 5,
                label: "$rating",

              ),
              SizedBox(height: 80.0),
              ElevatedButton.icon(
                label: Icon(
                  Icons.arrow_forward,
                ),

                  icon: Text('Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,

                  ) ),
                  onPressed: (){
                  if((counter+1)==6)
                    {
                      ratingSum = ratingSum + rating;
                        Navigator.popAndPushNamed(context, '/end', arguments: Counter(
                        ratingSum),
                        );
                    }
                  else
                  {
                    setState(() {
                      counter++;
                      ratingSum = ratingSum + rating;
                      rating = 0;
                      col = Colors.redAccent;
                    });
                  }

                  },

              )

            ],
          ),
        ),
      ),
    );
  }
}



