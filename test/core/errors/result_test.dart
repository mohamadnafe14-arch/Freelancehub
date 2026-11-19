import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freelancehub/core/errors/failure.dart';
import 'package:freelancehub/core/errors/result.dart';

class _TestFailure extends Failure {
  const _TestFailure(super.message);
}

void main() {
  group('Result', () {
    test('represents a successful value', () {
      final Result<int> result = Right<Failure, int>(42);

      expect(result.match((_) => false, (value) => value == 42), isTrue);
    });

    test('represents a failure', () {
      const failure = _TestFailure('Request failed.');
      final Result<int> result = Left<Failure, int>(failure);

      expect(
        result.match((actual) => identical(actual, failure), (_) => false),
        isTrue,
      );
    });
  });

  test('Failure preserves its message', () {
    const failure = _TestFailure('Request failed.');

    expect(failure.message, 'Request failed.');
  });
}
