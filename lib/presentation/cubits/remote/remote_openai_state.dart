part of 'remote_openai_cubit.dart';

abstract class RemoteOpenAiState extends Equatable {
  final String? wineDescription;
  final String? wineRating;
  final String? producerDescription;
  final String? regionDescription;
  final String? wineCharacteristics;
  final String? foodRecommendation;
  final List<String>? imageUrls;
  final DioError? error;

  const RemoteOpenAiState({
    this.wineDescription = '',
    this.wineRating = '',
    this.producerDescription = '',
    this.regionDescription = '',
    this.wineCharacteristics = '',
    this.foodRecommendation = '',
    this.imageUrls,
    this.error,
  });

  RemoteOpenAiState copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    List<String>? imageUrls,
    DioError? error,
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
      imageUrls,
      error,
    ];
  }
}

class RemoteOpenAiInitalState extends RemoteOpenAiState {
  const RemoteOpenAiInitalState({
    super.wineDescription = '',
    super.wineRating = '',
    super.producerDescription = '',
    super.regionDescription = '',
    super.wineCharacteristics = '',
    super.foodRecommendation = '',
    super.imageUrls,
    super.error,
  });

  @override
  RemoteOpenAiState copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    List<String>? imageUrls,
    DioError? error,
  }) =>
      RemoteOpenAiInitalState(
          wineDescription: wineDescription = '',
          wineRating: wineRating = '',
          producerDescription: producerDescription = '',
          regionDescription: regionDescription = '',
          wineCharacteristics: wineCharacteristics = '',
          foodRecommendation: foodRecommendation = '',
          imageUrls: null,
          error: null);
}

class RemoteOpenAiLoading extends RemoteOpenAiState {
  const RemoteOpenAiLoading({
    super.wineDescription = '',
    super.wineRating = '',
    super.producerDescription = '',
    super.regionDescription = '',
    super.wineCharacteristics = '',
    super.foodRecommendation = '',
    super.imageUrls,
    super.error,
  });

  @override
  RemoteOpenAiState copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    List<String>? imageUrls,
    DioError? error,
  }) =>
      RemoteOpenAiLoading(
          wineDescription: wineDescription = '',
          wineRating: wineRating = '',
          producerDescription: producerDescription = '',
          regionDescription: regionDescription = '',
          wineCharacteristics: wineCharacteristics = '',
          foodRecommendation: foodRecommendation = '',
          imageUrls: null,
          error: null);
}

class RemoteOpenAiSuccess extends RemoteOpenAiState {
  const RemoteOpenAiSuccess({
    super.wineDescription = '',
    super.wineRating = '',
    super.producerDescription = '',
    super.regionDescription = '',
    super.wineCharacteristics = '',
    super.foodRecommendation = '',
    super.imageUrls,
    super.error,
  });

  @override
  RemoteOpenAiState copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    List<String>? imageUrls,
    DioError? error,
  }) =>
      RemoteOpenAiSuccess(
          wineDescription: wineDescription ?? this.wineDescription,
          wineRating: wineRating ?? this.wineRating,
          producerDescription: producerDescription ?? this.producerDescription,
          regionDescription: regionDescription ?? this.regionDescription,
          wineCharacteristics: wineCharacteristics ?? this.wineCharacteristics,
          foodRecommendation: foodRecommendation ?? this.foodRecommendation,
          imageUrls: imageUrls ?? this.imageUrls,
          error: error ?? this.error);
}

class RemoteOpenAiFailed extends RemoteOpenAiState {
  const RemoteOpenAiFailed({
    super.wineDescription = '',
    super.wineRating = '',
    super.producerDescription = '',
    super.regionDescription = '',
    super.wineCharacteristics = '',
    super.foodRecommendation = '',
    super.imageUrls,
    super.error,
  });

  @override
  RemoteOpenAiState copyWith({
    String? wineDescription,
    String? wineRating,
    String? producerDescription,
    String? regionDescription,
    String? wineCharacteristics,
    String? foodRecommendation,
    List<String>? imageUrls,
    DioError? error,
  }) =>
      RemoteOpenAiFailed(
          wineDescription: wineDescription ?? this.wineDescription,
          wineRating: wineRating ?? this.wineRating,
          producerDescription: producerDescription ?? this.producerDescription,
          regionDescription: regionDescription ?? this.regionDescription,
          wineCharacteristics: wineCharacteristics ?? this.wineCharacteristics,
          foodRecommendation: foodRecommendation ?? this.foodRecommendation,
          imageUrls: imageUrls ?? this.imageUrls,
          error: error ?? this.error);
}
