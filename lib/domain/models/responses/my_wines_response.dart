import 'package:equatable/equatable.dart';

import '../wine.dart';

class MyWinesResponse extends Equatable {
  final int totalResults;
  final List<Wine> wines;

  const MyWinesResponse({
    required this.totalResults,
    required this.wines,
  });

  factory MyWinesResponse.fromMap(Map<String, dynamic> map) {
    return MyWinesResponse(
        totalResults: (map['totalResults'] ?? 0) as int,
        wines: List<Wine>.from(
          map['wines'].map<Wine>(
            (x) => Wine.fromMap(x as Map<String, dynamic>),
          ),
        ));
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [totalResults, wines];
}
