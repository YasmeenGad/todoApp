class TaskModel {
  String? id;
  String? title;
  int? date;
  bool? isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['isDone'] = this.isDone;
    return data;
  }
}
