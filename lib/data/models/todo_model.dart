class TodoModel {
  final int id;
  final String eventName;
  final String eventDescription;
  final String eventLocation;
  final int priorityColor;
  final String time;
  final int remainder;
  final DateTime taskDate;

  TodoModel({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,
    required this.priorityColor,
    required this.time,
    required this.remainder,
    required this.taskDate
  });

  factory TodoModel.fromJson(Map<String, Object?> json) => TodoModel(
        id: json["id"] as int,
        eventName: json["eventName"] as String,
        eventDescription: json["eventDescription"] as String,
        eventLocation: json["eventLocation"] as String,
        priorityColor: json["priorityColor"] as int,
        time: json["time"] as String,
        remainder: json["remainder"] as int,
        taskDate: DateTime.parse(json["taskDate"] as String),
      );

  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "eventDescription": eventDescription,
        "eventLocation": eventLocation,
        "priorityColor": priorityColor,
        "time": time,
        "remainder": remainder,
        "taskDate":taskDate.toIso8601String(),
      };

  

  @override
  String toString() {
    return 'TodoModel(id: $id, eventName: $eventName, eventDescription: $eventDescription, eventLocation: $eventLocation, priorityColor: $priorityColor, time: $time, remainder: $remainder, taskDate: $taskDate)';
  }
}
