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

### Screenshots

<img src="https://github.com/kokemus/kd_feedback/blob/master/screenshots/full_form_light.png?raw=true" alt="Full form light theme" width="250"/>
<img src="https://github.com/kokemus/kd_feedback/blob/master/screenshots/first_form_dark.png?raw=true" alt="First page form dark theme" width="250"/>
<img src="https://github.com/kokemus/kd_feedback/blob/master/screenshots/second_form_dark.png?raw=true" alt="Second page form dark theme" width="250"/>
<img src="https://github.com/kokemus/kd_feedback/blob/master/screenshots/third_form_dark.png?raw=true" alt="Third page form dark theme" width="250"/>