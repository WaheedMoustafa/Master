abstract class Failure {
  String errorMsg;
  Failure(this.errorMsg);
}

class ApiFailure extends Failure {
  ApiFailure([String? errorMsg]):super(errorMsg?? 'Something Went Wrong') ;
}
