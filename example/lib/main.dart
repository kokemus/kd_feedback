import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kd_feedback/kd_feedback.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Feedback(),
    );
  }
}

class Feedback extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      
        centerTitle: true,  
        title: Text('Feedback Demo'),
        actions: <Widget>[
          FeedbackIconButton(onSubmit: (feedback) { 
            print(feedback);
            return Future.delayed(Duration(seconds: 2), () {
              throw HttpException("Server error");
            });
          },),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FeedbackForm(
          onSubmit: (feedback) async {
            print(feedback);
            await _sendFeedback(feedback);
          },
        )
      ),
      floatingActionButton: Theme(data: ThemeData.dark(),
      child: FeedbackFloatingActionButton(onSubmit: (feedback) async { 
        print(feedback);
        await _sendFeedback(feedback);
       },),),
    );
  }

  _sendFeedback(FeedbackModel feedback) async {
    return Future.delayed(Duration(seconds: 2), () {
      return null;
    });
  }
}
