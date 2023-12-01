abstract class TripEvent {}

class SearchTripsEvent extends TripEvent {
  final String departure;
  final String destination;
  final String date;

  SearchTripsEvent({
    required this.departure,
    required this.destination,
    required this.date,
  });
}
