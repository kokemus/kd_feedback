import 'package:flutter/material.dart';

import 'feedback_localizations.dart';

class SatisfactionRating extends StatelessWidget {
  final Function(int) onSelected;
  final Color color;
  final int rate;
  @required final FeedbackLocalizations localizations;
  
  SatisfactionRating({this.rate, this.onSelected, this.color, this.localizations});

  @override
  Widget build(BuildContext context) {
    var satisfactionDescription = '';
    var isSelected = [false, false, false, false, false];
    if (rate != null) {
      satisfactionDescription = localizations.satisfactionLevelTexts[rate - 1];
      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
        if (buttonIndex == rate - 1) {
          isSelected[buttonIndex] = true;
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    }
    return Column(
      children: <Widget>[
        ToggleButtons(
          borderWidth: 16.0,
          color: color,
          selectedColor: Theme.of(context).accentColor,
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,              
          children: [
            Icon(Icons.sentiment_very_dissatisfied, size: 48,),
            Icon(Icons.sentiment_dissatisfied, size: 48,),
            Icon(Icons.sentiment_neutral, size: 48,),
            Icon(Icons.sentiment_satisfied, size: 48,),
            Icon(Icons.sentiment_very_satisfied, size: 48,),
          ],
          onPressed: (int index) {
            if (onSelected != null) onSelected(index + 1);
          }, isSelected: isSelected,
        ),
        Text(satisfactionDescription)
      ],
    );
  }
}