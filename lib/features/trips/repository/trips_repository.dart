import 'package:dio/dio.dart';
import 'package:trips/core/errors/errors.dart';
import 'package:trips/core/network/connectivity_info.dart';
import 'package:trips/core/network/network_service.dart';
import 'package:trips/features/trips/bloc/trip_event.dart';
import 'package:trips/features/trips/models/trip_model.dart';
import 'package:trips/injection_container.dart';

class TripsRepository {
  NetworkService networkService = locator.get<NetworkService>();
  ConnectivityInfo connectivityInfo = locator.get<ConnectivityInfo>();

  Future<(KError?, List<TripModel>?)> getTrips(
      {required SearchTripsEvent searchEvent}) async {
    try {
      if (!await connectivityInfo.isConnected()) {
        return (NoInternet(), null);
      }

      var res = await networkService.httpClient.get(
        '/avibus/search_trips_cities/',
        queryParameters: {
          'departure_city': searchEvent.departure,
          'destination_city': searchEvent.destination,
          'date': searchEvent.date,
        },
      );
      if (res.statusCode == 200 && res.data['trips'] != null) {
        List<TripModel> items = List.from(res.data['trips'].map((e) {
          return TripModel.fromMap(e);
        }));
        return (null, items);
      }
      return (ServerError(), null);
    } on DioException catch (e) {
      return (ServerError(err: e.error, message: e.message), null);
    } catch (e) {
      return (ServerError(), null);
    }
  }
}
