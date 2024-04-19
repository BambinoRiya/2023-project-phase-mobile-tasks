class Failure {
  String message;

  Failure(this.message);
}

class ServeFailure extends Failure {
  ServeFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
