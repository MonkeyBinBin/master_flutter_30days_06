import 'dart:math';

void main(List<String> arguments) {
  try {
    throwRandomException();
  } on MyCustomException catch (e) {
    print('Caught my custom exception: $e');
  } on FormatException catch (e) {
    print('Caught format exception: $e');
  } catch (e) {
    print('Caught generic exception: $e');
  } finally {
    print('This is the finally block, it always gets executed');
  }
}

/// Throws a random exception
void throwRandomException() {
  Random random = Random();
  int randomNumber = random.nextInt(3);

  switch (randomNumber) {
    case 0:
      throw MyCustomException('Random custom exception');
    case 1:
      throw FormatException('Random format exception');
    case 2:
      throw Exception('Random generic exception');
  }
}

/// Validates the username
void validateUsername(String username) {
  if (username.isEmpty) {
    throw ArgumentError('Username cannot be empty');
  }
  if (username.length < 5) {
    throw ArgumentError('Username must be at least 5 characters long');
  }
}

/// Custom exception class
class MyCustomException implements Exception {
  final String message;

  MyCustomException(this.message);

  @override
  String toString() => "MyCustomException: $message";
}
