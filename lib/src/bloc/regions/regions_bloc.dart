import 'package:bloc/bloc.dart';
import 'package:edu_planner/src/service/api/api_provider/api_provider.dart';
import 'package:edu_planner/src/service/api/models/regions/regions_response.dart';
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
        getRegions: () async{
          emit(state.copyWith(isLoading: true));
          final response = await _apiProvider.getRegions();
          emit(state.copyWith(isLoading: false,regions: response));
        },
      );
    });
  }
}
