import 'package:flutter/material.dart';

import 'feedback_localizations.dart';

enum FeedbackType {
  Bug,
  FeatureRequest,
  Problem,
  Like
}

class FeedbackTypeSelect extends StatelessWidget {
  final Function(FeedbackType) onSelected;
  final Color color;
  final FeedbackType type;
  @required final FeedbackLocalizations localizations;

  FeedbackTypeSelect({this.type, this.onSelected, this.color, this.localizations});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(localizations.feedbackTypeTexts[0], style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.Bug, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text(localizations.feedbackTypeTexts[1], style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.FeatureRequest, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text(localizations.feedbackTypeTexts[2], style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.Problem, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text(localizations.feedbackTypeTexts[3], style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.Like, 
          onChanged: _onChanged,
        ) 
      ]
    );
  }

  _onChanged(value) {         
    if (onSelected != null) onSelected(value);
  }
}