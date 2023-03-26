import '../../domain/models/requests/chatgpt_request.dart';
import '../../domain/models/requests/login_request.dart';
import '../../domain/models/requests/my_wines_request.dart';
import '../../domain/models/requests/openapi_image_request.dart';
import '../../domain/models/responses/login_response.dart';
import '../../domain/models/responses/my_wines_response.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/remote/wines_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final WinesApiService _winesApiService;

  ApiRepositoryImpl(this._winesApiService);

  @override
  Future<DataState<MyWinesResponse>> getMyWines({
    required MyWinesRequest request,
    required String token,
  }) {
    return getStateOf<MyWinesResponse>(
      request: () => _winesApiService.getMyWines(jwtToken: token.toString()),
    );
  }

  @override
  Future<DataState<LoginResponse>> login({required LoginRequest request}) {
    return getStateOf<LoginResponse>(
      request: () => _winesApiService.login(
          request: LoginRequest(
              userName: request.userName, password: request.password)),
    );
  }

  @override
  Future<DataState<String>> askChatGPT({required ChatGptRequest request}) {
    return getStateOf<String>(
      request: () => _winesApiService.askChatGPT(
          question: request.question, jwtToken: request.token),
    );
  }

  @override
  Future<DataState<List<String>>> generateImageUrl(
      {required OpenAiImageRequest request}) {
    return getStateOf<List<String>>(
      request: () => _winesApiService.generateImageUrl(
          question: request.question, jwtToken: request.token),
    );
  }
}
