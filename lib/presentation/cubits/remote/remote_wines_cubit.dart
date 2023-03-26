import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import '../../../domain/models/requests/login_request.dart';
import '../../../domain/models/requests/my_wines_request.dart';
import '../../../domain/models/wine.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_wines_state.dart';

class RemoteWinesCubit extends BaseCubit<RemoteWinesState, List<Wine>> {
  final ApiRepository _apiRepository;

  RemoteWinesCubit(this._apiRepository) : super(const RemoteWinesLoading(), []);

  Future<void> getMyWines() async {
    if (isBusy) return;

    await run(() async {
      // Create storage
      const storage = FlutterSecureStorage();

      // Read value
      String? jwt = await storage.read(key: 'jwt');

      // Call the repository
      final response = await _apiRepository.getMyWines(
          request: MyWinesRequest(), token: 'Bearer $jwt');

      if (response is DataSuccess) {
        final wines = response.data!.wines;
        //final noMoreData = wines.length < defaultPageSize;

        data.addAll(wines);
        //_page++;

        emit(RemoteWinesSuccess(wines: data, noMoreData: true));
      } else if (response is DataFailed) {
        emit(RemoteWinesFailed(error: response.error));
      }
    });
  }
}
