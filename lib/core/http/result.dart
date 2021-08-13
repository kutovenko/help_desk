///Обертка для результатов запросов. Упрощенная, только два состояния
class Result<A, B extends Exception> {
  void process(Function(A) onSuccess, Function(B) onError) {
    if (this is Success) {
      onSuccess.call((this as Success)._value);
    } else if (this is Error) {
      onError.call((this as Error)._error as B);
    }
  }

  bool isSuccess() {
    return this is Success<A, B>;
  }

  bool isError() {
    return this is Error<A, B>;
  }

  Success<A, B> asSuccess() {
    return this as Success<A, B>;
  }

  Error<A, B> asError() {
    return this as Error<A, B>;
  }
}

class Success<A, B extends Exception> extends Result<A, B> {
  final A _value;

  A get value => _value;

  Success(this._value);
}

class Error<A, B extends Exception> extends Result<A, B> {
  final B _error;

  B get error => _error;

  Error(this._error);
}
