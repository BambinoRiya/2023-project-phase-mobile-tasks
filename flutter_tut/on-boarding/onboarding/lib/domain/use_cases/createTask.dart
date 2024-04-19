
import 'package:dartz/dartz.dart' hide Task;
import 'package:onboarding/core/error/failure.dart';
import 'package:onboarding/core/usecases.dart';
import 'package:onboarding/domain/repositories/repository.dart';
import 'package:onboarding/domain/entities/task_class.dart';

class CreateUser implements Usecase<String, Task> {
  final TaskRepository repo;

  CreateUser(this.repo);

  @override
  Future<Either<Failure, String>> call(Task params) async {
    return await repo.createTask(params.taskName, params.description, params.status);
  }
}