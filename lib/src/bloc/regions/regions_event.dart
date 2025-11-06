part of 'regions_bloc.dart';

@freezed
class RegionsEvent with _$RegionsEvent {
  const factory RegionsEvent.started() = _Started;
  const factory RegionsEvent.getRegions() = _GetRegions;
}
