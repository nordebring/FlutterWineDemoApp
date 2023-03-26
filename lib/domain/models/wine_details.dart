import 'package:equatable/equatable.dart';

abstract class WineDetails extends Equatable {
  final String? wineDescription;
  final String? wineRating;
  final String? producerDescription;
  final String? regionDescription;
  final String? wineCharacteristics;
  final String? foodRecommendation;
  final String? imageUrl;

  const WineDetails({
    this.wineDescription = '',
    this.wineRating = '',
    this.producerDescription = '',
    this.regionDescription = '',
    this.wineCharacteristics = '',
    this.foodRecommendation = '',
    this.imageUrl = '',
  });

  WineDetails copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    String? imageUrl,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      wineDescription,
      wineRating,
      producerDescription,
      regionDescription,
      wineCharacteristics,
      foodRecommendation,
      imageUrl,
    ];
  }
}
