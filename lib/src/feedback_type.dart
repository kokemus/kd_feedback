import 'package:flutter/material.dart';

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

  FeedbackTypeSelect({this.type, this.onSelected, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text('I found a bug', style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.Bug, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I have a feature request', style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.FeatureRequest, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I have a problem', style: TextStyle(color: color),),
          groupValue: type,
          value: FeedbackType.Problem, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I like', style: TextStyle(color: color),),
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