import 'package:flutter/material.dart';

class FeedbackType extends StatelessWidget {
  final Function(int) onSelected;
  final Color color;
  final int type;

  FeedbackType({this.type, this.onSelected, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text('I found a bug', style: TextStyle(color: color),),
          groupValue: type,
          value: 1, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I have a feature request', style: TextStyle(color: color),),
          groupValue: type,
          value: 2, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I have a problem', style: TextStyle(color: color),),
          groupValue: type,
          value: 3, 
          onChanged: _onChanged,
        ),
        RadioListTile(
          title: Text('I like', style: TextStyle(color: color),),
          groupValue: type,
          value: 4, 
          onChanged: _onChanged,
        ) 
      ]
    );
  }

  _onChanged(value) {         
    if (onSelected != null) onSelected(value);
  }
}