# kd_feedback

A Flutter package for gathering a feedback from a user.

## Usage

```
dependencies:
  kd_feedback:
    git:
      url: git://github.com/kokemus/kd_feedback.git

```

### Examples

``` dart
import 'package:kd_feedback/kd_feedback.dart';

body: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: FeedbackForm(
        onSubmit: (feedback) async {
            await _sendFeedback(feedback);
        },
    )
),

floatingActionButton: FeedbackFloatingActionButton(
    onSubmit: (feedback) async {
        await _sendFeedback(feedback);
    },
)

FeedbackIconButton(
    onSubmit: (feedback) async {
        await _sendFeedback(feedback);
    },
)


```
