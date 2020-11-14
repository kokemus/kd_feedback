abstract class FeedbackLocalizations {
  /// Text for statisfaction question (step 1)  
  String get satisfactionQuestionText;

  /// Texts for statisfaction levels 1 - 5
  List<String> get satisfactionLevelTexts;

  /// Text for feedback type question (step 2)
  String get feedbackTypeQuestionText;

  /// Texts for 4 feedback types
  List<String> get feedbackTypeTexts; 
  
  /// Text for feeback description request (step 3)
  String get feedbackDescriptionRequestText;

  /// Label for feedback description hint
  String get feedbackDescriptionHintLabel;  

  /// Label for submit button
  String get submitButtonLabel;

  /// Label for submit button after submit failed
  String get submitButtonErrorLabel;

  /// Label for submit button after submit succeeded
  String get submitButtonSuccessLabel;  
}

class DefaultFeedbackLocalizations extends FeedbackLocalizations {
  @override
  String satisfactionQuestionText = 'How statisfied are you with the application?';

  @override
  List<String> satisfactionLevelTexts = [
    'Very dissatisfied', 
    'Somewhat dissatisfied', 
    'Neither satisfied or dissatisfied',
    'Somewhat satisfied', 
    'Very satisfied'
  ];

  @override
  String feedbackTypeQuestionText = 'Can we help you somehow?';

  @override
  List<String> feedbackTypeTexts = [
    'I found a bug', 
    'I have a feature request', 
    'I have a problem',
    'I like'
  ];

  @override
  String feedbackDescriptionRequestText = 'Please give us some details';

  @override
  String feedbackDescriptionHintLabel = 'Description';

  @override
  String submitButtonErrorLabel = 'try again';

  @override
  String submitButtonLabel = 'submit';

  @override
  String submitButtonSuccessLabel = 'thank you';

  DefaultFeedbackLocalizations({
    String satisfactionQuestionText,
    List<String> satisfactionLevelTexts,
    String feedbackTypeQuestionText,
    List<String> feedbackTypeTexts,
    String feedbackDescriptionRequestText,
    String feedbackDescriptionHintLabel,
    String submitButtonLabel,
    String submitButtonErrorLabel,
    String submitButtonSuccessLabel,
  }) {
    this.satisfactionQuestionText = satisfactionQuestionText ?? this.satisfactionQuestionText;
    this.satisfactionLevelTexts = satisfactionLevelTexts ?? this.satisfactionLevelTexts;
    this.feedbackTypeQuestionText = feedbackTypeQuestionText ?? this.feedbackTypeQuestionText;
    this.feedbackTypeTexts = feedbackTypeTexts ?? this.feedbackTypeTexts;
    this.feedbackDescriptionRequestText = feedbackDescriptionRequestText ?? this.feedbackDescriptionRequestText;
    this.feedbackDescriptionHintLabel = feedbackDescriptionHintLabel ?? this.feedbackDescriptionHintLabel;
    this.submitButtonLabel = submitButtonLabel ?? this.submitButtonLabel;
    this.submitButtonErrorLabel = submitButtonErrorLabel ?? this.submitButtonErrorLabel;
    this.submitButtonSuccessLabel = submitButtonSuccessLabel ?? this.submitButtonSuccessLabel;
  }
}