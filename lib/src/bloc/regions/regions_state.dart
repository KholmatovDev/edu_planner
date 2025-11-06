part of 'regions_bloc.dart';

@freezed
class RegionsState with _$RegionsState {
  const factory RegionsState.initial({
    required bool isLoading,
    RegionsResponse? regions,
  }) = _Initial;
}
