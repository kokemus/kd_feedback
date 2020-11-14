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
          FeedbackIconButton(
            localizations: FinnishFeedbackLocalization(), 
            onSubmit: (feedback) { 
              print(feedback);
              return Future.delayed(Duration(seconds: 2), () {
                throw HttpException("Server error");
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FeedbackForm(
          localizations: DefaultFeedbackLocalizations(
            satisfactionQuestionText: 'Ha statisfied are you with da application?'
          ),
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

class FinnishFeedbackLocalization extends FeedbackLocalizations {
  @override
  String get feedbackDescriptionHintLabel => 'Kuvaus';

  @override
  String get feedbackDescriptionRequestText => 'Kerro tarkemmin';

  @override
  String get feedbackTypeQuestionText => 'Voimmeko auttaa jotenkin?';

  @override
  List<String> get feedbackTypeTexts => [
    'Löysin virheen',
    'Minulla on ominaisuuspyyntö',
    'Minulla on ongelma',
    'Minä pidän'
  ];

  @override
  List<String> get satisfactionLevelTexts => [
    'Erittäin tyytymätön',
    'Jossain määrin tyytymätön',
    'Ei tyytyväinen eikä tyytymätön',
    'Jossain määrin tyytyväinen',
    'Erittäin tyytyväinen'
  ];

  @override
  String get satisfactionQuestionText => 'Kuinka tyytyväinen olet sovellukseen?';

  @override
  String get submitButtonErrorLabel => 'Yritä uudelleen';

  @override
  String get submitButtonLabel => 'Lähetä';

  @override
  String get submitButtonSuccessLabel => 'Kiitos palautteestasi';  
}