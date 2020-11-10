import 'dart:convert';

import 'package:my_app/core/error/exception.dart';
import 'package:my_app/features/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as https;
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource {
  ///calls the https://numbersapi.com/{number} endpoint
  ///
  ///Throws a [ServerException] for all error codes
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  ///calls the https://numbersapi.com/random endpoint
  ///
  ///Throws a [ServerException] for all error codes
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final https.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    //! Mocked respons since http causes problems on native environments
    final testNumberTriviaModel =
        NumberTriviaModel(number: 1, text: 'test trivia');

    return testNumberTriviaModel;
    //! Connection call to API
    /*
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
    */
  }
}
