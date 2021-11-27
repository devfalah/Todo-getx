class Task {
  int? id;
  String? title;
  String? note;
  bool isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted = false,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': note,
      'isCompleted': isCompleted ? 1 : 0,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      title: map['title'] as String?,
      note: map['note'] as String?,
      isCompleted: map['isCompleted'] == 1,
      date: map['date'] as String?,
      startTime: map['startTime'] as String?,
      endTime: map['endTime'] as String?,
      color: map['color'] as int,
      remind: map['remind'] as int?,
      repeat: map['repeat'] as String?,
    );
  }
}
