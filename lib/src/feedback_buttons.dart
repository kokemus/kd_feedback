import 'package:flutter/material.dart';

import 'feedback_form.dart';
import 'feedback_localizations.dart';
import 'feedback_model.dart';

class FeedbackIconButton extends StatelessWidget {
  final Future Function(FeedbackModel) onSubmit;
  final FeedbackLocalizations localizations;

  FeedbackIconButton({
    @required this.onSubmit, 
    this.localizations    
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.feedback), onPressed: () {
      showFeedbackBottomSheet(context: context, onSubmit: onSubmit, localizations: localizations);
    });
  }
}

class FeedbackFloatingActionButton extends StatelessWidget {
  final Future Function(FeedbackModel) onSubmit;
  final FeedbackLocalizations localizations;

  FeedbackFloatingActionButton({
    @required this.onSubmit, 
    this.localizations
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(child: Icon(Icons.feedback), onPressed: () {
      showFeedbackBottomSheet(context: context, onSubmit: onSubmit, localizations: localizations);
    });
  }
}

Future<T> showFeedbackBottomSheet<T>({
  @required BuildContext context,
  @required Future Function(FeedbackModel) onSubmit,
  FeedbackLocalizations localizations
}) {
  assert(context != null);
  return showModalBottomSheet(
    context: context, 
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 300,
        child: FeedbackForm(
          onSubmit: onSubmit, 
          onSubmitted: () { 
            Future.delayed(Duration(milliseconds: 1000), () {  
              Navigator.of(context).pop(); 
            });
          },
          paged: true,
          localizations: localizations,
        ),
      ),
    )
  );
}