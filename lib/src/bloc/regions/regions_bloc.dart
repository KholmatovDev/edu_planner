import 'package:bloc/bloc.dart';
import 'package:edu_planner/src/service/api/api_provider/api_provider.dart';
import 'package:edu_planner/src/service/api/models/classes/classes_response.dart';
import 'package:edu_planner/src/service/api/models/regions/regions_response.dart';
import 'package:edu_planner/src/service/api/models/schools/schools_response.dart';
import 'package:edu_planner/src/service/di/di.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'regions_event.dart';

part 'regions_state.dart';

part 'regions_bloc.freezed.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  RegionsBloc() : super(const RegionsState.initial(isLoading: false)) {
    on<RegionsEvent>((event, emit) async {
      final _apiProvider = locator.get<ApiProvider>();
      await event.when(
        started: () {},

        //Regions
        getRegions: () async {
          emit(state.copyWith(isLoading: true));
          final response = await _apiProvider.getRegions();
          emit(state.copyWith(isLoading: false, regions: response));
        },
        setRegion: (name) {
          final region = state.regions!.regions.firstWhere((element) => element.name == name,);
          add(RegionsEvent.getSchools());
          emit(state.copyWith(selectedRegion: region.id,selectedRegionName: region.name));
        },

        //Schools
        getSchools: () async{
          emit(state.copyWith(isLoading: true,selectedSchool: null,selectedSchoolName: null));
          final response = await _apiProvider.getSchools(state.selectedRegion??"");
          emit(state.copyWith(schools: response,isLoading: false));
        },
        setSchool: (name) {
          final school = state.schools!.schools.firstWhere((element) => element.name == name,);
          emit(state.copyWith(selectedSchool: school.id,selectedSchoolName: school.name));
        },

        //Classes
        getClasses: () async{

        },
        setClass: (name) {

        },
      );
    });
  }
}
