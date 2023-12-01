import 'package:trips/core/errors/errors.dart';
import 'package:trips/features/trips/models/trip_model.dart';

abstract class TripState {}

class InitialTripState extends TripState {
  List<TripModel> trips = [];
  InitialTripState({required this.trips});
}

class LoadingTripState extends TripState {}

class EmptyTripState extends TripState {
  String text = 'Поездок не найдено';
}

class ErrorTripState extends TripState {
  KError? error;
  ErrorTripState(this.error);
}
