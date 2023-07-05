import 'package:koobeam/modules/list_users/exceptions/no_internet_exception.dart';

abstract class ExceptionCreator {
  static Exception checkException<T extends Exception>() {
    switch (T) {
      case NoInternetException:
        return NoInternetException();

      default:
        return Exception();
    }
  }
}
