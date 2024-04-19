import 'package:dartz/dartz.dart' hide Task;
import 'package:onboarding/core/error/failure.dart';
import 'package:onboarding/core/usecases.dart';
import 'package:onboarding/domain/entities/task_class.dart';
import 'package:onboarding/domain/repositories/repository.dart';




class ViewTask implements Usecase<Task,String>{
  final TaskRepository repository;
  ViewTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(String id) async {
    return await repository.viewDetails(id);
  }
}

