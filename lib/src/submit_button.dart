import 'package:flutter/material.dart';

class CapsText extends Text {
  CapsText(String data, {TextStyle style}) : super(data.toUpperCase(), style: style);
}

enum SubmitButtonState {
  initial,
  submitting,
  error,
  success
}

class SubmitButton extends StatelessWidget {
  final SubmitButtonState state;
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color textColor;

  SubmitButton({@required this.state, @required this.label,  @required this.onPressed, 
    this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    var child;
    switch (state) {
      case SubmitButtonState.success:
        child = RaisedButton.icon(
          color: Colors.green,
          textColor: Colors.white,
          label: label != null ? CapsText(label) : CapsText('success'), 
          icon: Icon(Icons.check_circle_outline),
          onPressed: onPressed,
        );
        break;
      case SubmitButtonState.error:
        child = RaisedButton.icon(
          color: Colors.red,
          textColor: Colors.white,
          label: label != null ? CapsText(label) : CapsText('try again'), 
          icon: Icon(Icons.error_outline),
          onPressed: onPressed,
        );
        break;
      case SubmitButtonState.submitting:
        child = RaisedButton(
          disabledColor: Theme.of(context).accentColor,
          child: CircularProgressIndicator(backgroundColor: Colors.white,), 
          onPressed: null
        );
        break; 
      case SubmitButtonState.initial:     
      default:
        child = RaisedButton(
          color: color ?? Theme.of(context).accentColor,
          textColor: textColor ?? Colors.white,
          child: CapsText(label), 
          onPressed: onPressed
        );
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          child: child, 
          axis: Axis.horizontal, 
          sizeFactor: animation,
        );
      },
      child: SizedBox(
        key: ValueKey<int>(state.index),
        width: double.infinity,
        height: 56,
        child: child,
      ),
    );
  }
}