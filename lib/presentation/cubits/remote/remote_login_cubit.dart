import 'package:basic_login/domain/models/requests/login_request.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';

part 'remote_login_state.dart';

class RemoteLoginCubit extends Cubit<RemoteLoginState> {
  final ApiRepository _apiRepository;

  RemoteLoginCubit(this._apiRepository) : super(const RemoteLoginUpdate());

  void updateEmail(String email) =>
      emit(RemoteLoginUpdate(email: email, password: state.password));
  void updatePassword(String password) =>
      emit(RemoteLoginUpdate(email: state.email, password: password));

  Future<void> login() async {
    // Call the repository
    var request = LoginRequest(userName: state.email, password: state.password);
    final response = await _apiRepository.login(request: request);

    if (response is DataSuccess) {
      final String token = response.data!.token;
      //final String expiration = response.data!.expiration;

      // Create storage
      const storage = FlutterSecureStorage();

      // write value
      await storage.write(key: 'jwt', value: token);

      // Set Success state
      emit(const RemoteLoginSuccess());
    } else if (response is DataFailed) {
      emit(RemoteLoginUpdate(email: state.email, password: state.password));
    }
  }
}
