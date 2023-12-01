import 'package:trips/features/trips/presentaion/bloc/trip_bloc.dart';

abstract class TripState {}

class InitialTripState extends TripState {}

class LoadingTripState extends TripState {}

class ErrorTripState extends TripState {}
