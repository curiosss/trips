import 'package:get_it/get_it.dart';
import 'package:trips/core/network/connectivity_info.dart';
import 'package:trips/core/network/network_service.dart';
import 'package:trips/features/trips/bloc/trip_bloc.dart';

final locator = GetIt.instance;

setupDependencies() async {
  locator.registerSingleton(NetworkService());
  locator.registerSingleton(ConnectivityInfo());
  locator.registerSingleton(TripsBloc());
}
