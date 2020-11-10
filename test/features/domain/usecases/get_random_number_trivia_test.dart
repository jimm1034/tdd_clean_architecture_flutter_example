//start by setting up a mock of repository of NumberTrivia

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/domain/entities/number_trivia.dart';
import 'package:my_app/features/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final testNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test(
    'should get trivia from the repository',
    () async {
      //arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(testNumberTrivia));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, Right(testNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
