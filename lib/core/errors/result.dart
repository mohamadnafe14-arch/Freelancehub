import 'package:fpdart/fpdart.dart';

import 'failure.dart';

typedef Result<T> = Either<Failure, T>;
