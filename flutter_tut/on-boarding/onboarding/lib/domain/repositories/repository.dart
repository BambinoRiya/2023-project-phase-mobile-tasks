import 'package:dartz/dartz.dart' hide Task;
import 'package:onboarding/core/error/failure.dart';
import 'package:onboarding/domain/entities/task_class.dart';

abstract class TaskRepository {
  // Method to create a new task
  Future<Either<Failure, String>> createTask(Task task);

  // Method to retrieve all tasks
  Future<Either<Failure, List<Task>>> viewAllTasks();

  // Future<Either<Failure, Task>> getTaskById(String id);

  // Method to delete a task
  Future<Either<Failure, void>> viewDetails(String id);
}
