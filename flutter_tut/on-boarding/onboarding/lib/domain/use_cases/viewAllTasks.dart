import 'package:dartz/dartz.dart' hide Task;
import 'package:onboarding/core/usecases.dart';
import 'package:onboarding/domain/repositories/repository.dart';
import 'package:onboarding/core/error/failure.dart';
import 'package:onboarding/domain/entities/task_class.dart';


class ViewTask implements Usecase<List<Task>, String> {
  final TaskRepository repo;

  ViewTask(this.repo);

  @override
  Future<Either<Failure, List<Task>>> call(params) async {
    return await repo.viewAllTasks();
  }
}