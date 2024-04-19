enum TaskStatus { completed, pending, due }

class Task {
  late final String taskName;
  late final DateTime dueDate;
  late final String description;
  late final TaskStatus status;

  Task(
      {required this.taskName,
      required this.dueDate,
      required this.description,
      required this.status});
}
