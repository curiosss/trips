import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/features/trips/bloc/trip_event.dart';
import 'package:trips/features/trips/bloc/trip_state.dart';
import 'package:trips/features/trips/repository/trips_repository.dart';

class TripsBloc extends Bloc<TripEvent, TripState> {
  TripsRepository tripsRepository = TripsRepository();

  TripsBloc() : super(InitialTripState(trips: [])) {
    on<SearchTripsEvent>((event, emit) async {
      emit(LoadingTripState());

      var data = await tripsRepository.getTrips(searchEvent: event);
      if (data.$1 != null) {
        emit(ErrorTripState(data.$1));
      } else if (data.$2 != null) {
        if (data.$2!.isEmpty) {
          emit(EmptyTripState());
          return;
        }
        emit(InitialTripState(trips: data.$2!));
      }
    });
  }

  // @override
  // Stream<TripState> mapEventToState(TripEvent event) async* {
  //   if (event is SearchTripsEvent) {
  //     print(event.departure);
  //     yield LoadingTripState();
  //     // yield InitialCounterState(count: state.count + 1);
  //   }

  // }
}
