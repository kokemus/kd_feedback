import 'dart:convert';

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
  /// 1 'I found a bug'
  /// 2 'I have a feature request'
  /// 3 'I have a problem'
  /// 4 'I like' 
  int type;
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
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return json.encode(this.toJson());
  }
}