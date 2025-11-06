part of 'regions_bloc.dart';

@freezed
class RegionsEvent with _$RegionsEvent {
  const factory RegionsEvent.started() = _Started;
  //Regions
  const factory RegionsEvent.getRegions() = _GetRegions;
  const factory RegionsEvent.setRegion(String name) = _SetRegion;
  //Schools
  const factory RegionsEvent.getSchools() = _GetSchools;
  const factory RegionsEvent.setSchool(String name) = _SetSchool;
  //Classes
  const factory RegionsEvent.getClasses() = _GetClasses;
  const factory RegionsEvent.setClass(String name) = _SetClass;
}
