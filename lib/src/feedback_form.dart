import 'package:flutter/material.dart';
import 'submit_button.dart';
import 'feedback_type.dart';
import 'satisfaction_rating.dart';
import 'feedback_model.dart';

class FeedbackForm extends StatefulWidget {
  final paged;
  final Future Function(FeedbackModel) onSubmit;
  final VoidCallback onSubmitted;
  final VoidCallback onReset;  

  FeedbackForm({
    @required this.onSubmit,
    this.onSubmitted,
    this.onReset,
    this.paged = false, 
  });

  @override
  State<StatefulWidget> createState() => FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackForm> {
  final _fromKey = GlobalKey<FormState>();
  final _controller = PageController();
  var _autoValidate = AutovalidateMode.disabled;
  FeedbackModel _feedback = FeedbackModel();
  var _state = SubmitButtonState.initial;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      autovalidateMode: _autoValidate,
      onChanged: () {
        setState(() {
          _state = SubmitButtonState.initial;
        });
      },
      child: widget.paged ? _buildPagedForm(context) : _buildOnePageForm(context)
    );
  }

  Widget _buildPagedForm(BuildContext context) {    
    return PageView(
      controller: _controller,
      children: [
        _buildStep1(context, onSelected: (rate) {
          Future.delayed(Duration(milliseconds: 500), () {  
            _controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        }),
        _buildStep2(context, onSelected: (type) {
          Future.delayed(Duration(milliseconds: 500), () {  
            _controller.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        }),
        Column(children: [
          _buildStep3(context),
          SizedBox(height: 16,),
          _buildSubmitButton()
        ])
      ],
    );
  }

  Widget _buildOnePageForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStep1(context),
        SizedBox(height: 16,),
        _buildStep2(context),
        SizedBox(height: 16,),
        _buildStep3(context),
        SizedBox(height: 16,),
        _buildSubmitButton()
      ]
    );
  }

  SizedBox _buildSubmitButton() {
    return SizedBox(
        height: 48,
        width: double.infinity, 
        child: SubmitButton(
          state: _state,
          label: _state == SubmitButtonState.success 
            ? 'thank you' : _state == SubmitButtonState.error 
              ? 'try again' : 'submit', 
          onPressed: () async {
            if (_state != SubmitButtonState.success) {
              if (_fromKey.currentState.validate()) {  
                setState(() {
                  _state = SubmitButtonState.submitting;
                });
                try {
                  await widget.onSubmit(_feedback);           
                  setState(() {
                    _state = SubmitButtonState.success;
                    _autoValidate = AutovalidateMode.disabled;                    
                  });
                  if (widget.onSubmitted != null) {
                    widget.onSubmitted();
                  }
                } catch (e) {
                  print(e);
                  setState(() {
                    _state = SubmitButtonState.error;
                  });
                } 
              } else {
                setState(() {
                  _autoValidate = AutovalidateMode.always;
                });
              }
            } else {
              _fromKey.currentState.reset();
              _feedback = FeedbackModel();
              if (widget.onReset != null) {
                widget.onReset();
              }
            }
          }
        )
      );
  }

  Widget _buildStep1(BuildContext context, {onSelected(int)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text(
          'How statisfied are you with the application?',
          style: Theme.of(context).textTheme.headline5,
        ),
        Align(child: 
          FormField<int>(
            builder: (field) {
              return SatisfactionRating(
                rate: field.value,
                color: _validateSatisfaction(_feedback.satisfaction) != null && _autoValidate != AutovalidateMode.disabled
                  ? Colors.red : null, 
                onSelected: (rate) {
                  setState(() {
                    _feedback.satisfaction = rate;
                  });
                  field.didChange(rate);
                  if (onSelected != null) onSelected(rate);
                },
              );
            },
            validator: _validateSatisfaction
          ),
        ),
      ],
    );
  }

  Widget _buildStep2(BuildContext context, {onSelected(int)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text('Can we help you somehow?',
          style: Theme.of(context).textTheme.headline5,
        ),
        FormField<FeedbackType>(
          builder: (field) {
            return FeedbackTypeSelect(
              type: field.value,
              color: _validateType(_feedback.type) != null && _autoValidate != AutovalidateMode.disabled
                  ? Colors.red : null, 
              onSelected: (type) {
                setState(() {
                  _feedback.type = type;
                });
                field.didChange(type);
                if (onSelected != null) onSelected(type);
              }
            );
          },
          validator: _validateType,
        ),
      ]
    );
  }

  Widget _buildStep3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text('Please give us some details',
          style: Theme.of(context).textTheme.headline5,),
        SizedBox(height: 16,),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(), 
            hintText: 'Description',
            helperText: ''
          ),
          textInputAction: TextInputAction.done,
          maxLines: 5,
          autocorrect: false,
          onChanged: (value) {
            setState(() {
              _feedback.description = value;
            });
          },
          validator: _validateDescription,
        ),
      ]
    );
  }

  String _validateSatisfaction(int value) {
    if (_feedback.satisfaction != null 
      && _feedback.satisfaction >= 1 
      && _feedback.satisfaction <= 5) {
      return null;
    }
    return '';
  }

  String _validateType(FeedbackType value) {
    if (_feedback.type != null) {
      return null;
    }
    return '';
  }

  String _validateDescription(String value) {
    if (_feedback.description != null && _feedback.description.length > 0) {
      return null;
    }
    return '';
  }
}