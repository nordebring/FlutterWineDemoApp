import 'package:basic_login/domain/models/requests/login_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../domain/models/responses/login_response.dart';
import '../../../domain/models/responses/my_wines_response.dart';
import '../../../utils/constants/strings.dart';

part 'wines_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class WinesApiService {
  factory WinesApiService(Dio dio, {String baseUrl}) = _WinesApiService;

  @GET('Wine/GetMyWines')
  Future<HttpResponse<MyWinesResponse>> getMyWines({
    @Header('Authorization') required String jwtToken,
  });

  @POST('User/BearerToken')
  Future<HttpResponse<LoginResponse>> login(
      {@Body() required LoginRequest request});

  @GET('Openai/Chat')
  Future<HttpResponse<String>> askChatGPT(
      {@Header('Authorization') required String jwtToken,
      @Query('question') required String question});

  @GET('Openai/Image')
  Future<HttpResponse<List<String>>> generateImageUrl(
      {@Header('Authorization') required String jwtToken,
      @Query('question') required String question});
}
