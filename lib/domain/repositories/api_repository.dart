import 'package:basic_login/domain/models/requests/chatgpt_request.dart';
import 'package:basic_login/domain/models/requests/login_request.dart';
import '../../utils/resources/data_state.dart';
import '../models/requests/my_wines_request.dart';
import '../models/requests/openapi_image_request.dart';
import '../models/responses/login_response.dart';
import '../models/responses/my_wines_response.dart';

abstract class ApiRepository {
  Future<DataState<MyWinesResponse>> getMyWines(
      {required MyWinesRequest request, required String token});

  Future<DataState<LoginResponse>> login({required LoginRequest request});

  Future<DataState<String>> askChatGPT({required ChatGptRequest request});

  Future<DataState<List<String>>> generateImageUrl(
      {required OpenAiImageRequest request});
}
