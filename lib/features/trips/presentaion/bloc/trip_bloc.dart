import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_event.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_state.dart';

class TripsBloc extends Bloc<TripEvent, TripState> {
  TripsBloc() : super(InitialTripState()) {
    on<SearchTripsEvent>((event, emit) async {
      emit(LoadingTripState());
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
