import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/remote/wines_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  //locator.registerSingleton<AppDatabase>(db);

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: {
        'Action': 'application/json',
        'Content-Type': 'application/json',
      },
      //contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<WinesApiService>(
    WinesApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<WinesApiService>()),
  );
}
