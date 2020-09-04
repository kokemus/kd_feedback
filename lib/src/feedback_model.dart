import 'dart:convert';

class FeedbackModel {
  int satisfaction;
  int type;
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