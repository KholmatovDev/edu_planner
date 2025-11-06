part of 'regions_bloc.dart';

@freezed
class RegionsState with _$RegionsState {
  const factory RegionsState.initial({
    required bool isLoading,
    required bool isSchool,
    required bool isClass,
    //Schools
    SchoolsResponse? schools,
    String? selectedSchool,
    String? selectedSchoolName,
    //Regions
    RegionsResponse? regions,
    String? selectedRegionName,
    String? selectedRegion,
    //Classes
    ClassesResponse? Classes,
    String? selectedClassName,
    String? selectedClass,
  }) = _Initial;
}
