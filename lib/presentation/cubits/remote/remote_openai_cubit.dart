import 'package:basic_login/domain/models/requests/chatgpt_request.dart';
import 'package:basic_login/domain/models/requests/openapi_image_request.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../domain/models/wine.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_openai_state.dart';

class RemoteOpenAiCubit
    extends BaseCubit<RemoteOpenAiState, RemoteOpenAiInitalState> {
  final ApiRepository _apiRepository;

  RemoteOpenAiCubit(this._apiRepository)
      : super(const RemoteOpenAiLoading(), const RemoteOpenAiInitalState());

  Future<void> getWineDetails(Wine wine) async {
    if (isBusy) return;

    emit(const RemoteOpenAiLoading().copyWith());

    const storage = FlutterSecureStorage();
    String? jwt = await storage.read(key: 'jwt');

    List<String>? imageUrls = await getImageUrl(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
    ));

    String? wineCharacteristics =
        await getWineCharacteristics(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
      wineCharacteristics: wineCharacteristics?.trim(),
    ));

    String? wineDescription = await getWineDescription(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
      wineCharacteristics: wineCharacteristics?.trim(),
      wineDescription: wineDescription?.trim(),
    ));

    String? wineRating = await getWineRating(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
      wineCharacteristics: wineCharacteristics?.trim(),
      wineDescription: wineDescription?.trim(),
      wineRating: wineRating?.trim(),
    ));

    String? regionInfo = await getRegionInfo(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
      wineCharacteristics: wineCharacteristics?.trim(),
      wineDescription: wineDescription?.trim(),
      wineRating: wineRating?.trim(),
      regionDescription: regionInfo?.trim(),
    ));

    String? foodPairing = await getFoodPairing(jwt.toString(), wine);

    emit(const RemoteOpenAiSuccess().copyWith(
      imageUrls: imageUrls,
      wineCharacteristics: wineCharacteristics?.trim(),
      wineDescription: wineDescription?.trim(),
      wineRating: wineRating?.trim(),
      regionDescription: regionInfo?.trim(),
      foodRecommendation: foodPairing?.trim(),
    ));
  }

  Future<String?> getWineCharacteristics(String token, Wine wine) async {
    String question =
        "Can you describe the nose of ${wine.wineName} ${wine.vintage}?";

    return await callChatGPT(token, question);
  }

  Future<String?> getWineDescription(String token, Wine wine) async {
    String question =
        "Can you give me a detailed description of ${wine.wineName} ${wine.vintage}?";

    return await callChatGPT(token, question);
  }

  Future<String?> getWineRating(String token, Wine wine) async {
    String question =
        "Can you give me a detailed rating of ${wine.wineName} ${wine.vintage}?";

    return await callChatGPT(token, question);
  }

  Future<String?> getRegionInfo(String token, Wine wine) async {
    String question =
        "Can you give me a detailed description of the wine region ${wine.districtName}?";

    return await callChatGPT(token, question);
  }

  Future<String?> getFoodPairing(String token, Wine wine) async {
    String question =
        "What food pairing would you recommend to ${wine.wineName} ${wine.vintage}?";

    return await callChatGPT(token, question);
  }

  Future<String?> callChatGPT(String token, String question) async {
    final response = await _apiRepository.askChatGPT(
        request: ChatGptRequest(
      token: 'Bearer $token',
      question: question,
    ));

    if (response is DataSuccess) {
      String? description = response.data;
      return description;
    } else {
      emit(RemoteOpenAiFailed(error: response.error));
      return null;
    }
  }

  Future<List<String>?> getImageUrl(String token, Wine wine) async {
    String question = "${wine.districtName} wine";

    final response = await _apiRepository.generateImageUrl(
        request: OpenAiImageRequest(
      token: 'Bearer $token',
      question: question,
    ));

    if (response is DataSuccess) {
      List<String>? imageUrls = response.data;
      return imageUrls;
    } else {
      emit(RemoteOpenAiFailed(error: response.error));
      return null;
    }
  }
}
