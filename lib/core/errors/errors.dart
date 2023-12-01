class KError {
  final String message;
  KError(this.message);
}

class NoInternet extends KError {
  NoInternet({String? message})
      : super(message ?? 'Нет подключения к Интернету');
}

class ServerError extends KError {
  dynamic err;
  ServerError({
    String? message,
    this.err,
  }) : super(message ?? '');
}
