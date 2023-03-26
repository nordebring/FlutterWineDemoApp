part of 'remote_wines_cubit.dart';

abstract class RemoteWinesState extends Equatable {
  final List<Wine> wines;
  final bool noMoreData;
  final DioError? error;

  const RemoteWinesState({
    this.wines = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [wines, noMoreData, error];
}

class RemoteWinesLoading extends RemoteWinesState {
  const RemoteWinesLoading();
}

class RemoteWinesSuccess extends RemoteWinesState {
  const RemoteWinesSuccess({super.wines, super.noMoreData});
}

class RemoteWinesFailed extends RemoteWinesState {
  const RemoteWinesFailed({super.error});
}
