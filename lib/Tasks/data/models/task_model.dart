import 'package:to_do_list_app/Tasks/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    super.intId,
    super.strTitle,
    super.intIdDone,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      intId: map['intId'] as int?,
      strTitle: map['strTitle'] as String?,
      intIdDone: map['intIdDone'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strTitle': strTitle,
      'intIdDone': intIdDone,
    };
  }
}
