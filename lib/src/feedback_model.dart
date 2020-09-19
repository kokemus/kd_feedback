import 'dart:convert';

import 'feedback_type.dart';

class FeedbackModel {
  /// Five point scale statisfaction level:
  /// 
  /// 1 'Very dissatisfied'
  /// 2 'Somewhat dissatisfied'
  /// 3 'Neither satisfied or dissatisfied'
  /// 4 'Somewhat satisfied'
  /// 5 'Very satisfied'
  int satisfaction;
  /// Four types
  /// 
  /// 'I found a bug'
  /// 'I have a feature request'
  /// 'I have a problem'
  /// 'I like' 
  FeedbackType type;
  /// Free text description
  String description;

  FeedbackModel({this.satisfaction, this.type, this.description});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    satisfaction = json['satisfaction'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['satisfaction'] = this.satisfaction;
    data['type'] = this.type.index;
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return json.encode(this.toJson());
  }
}