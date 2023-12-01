import 'dart:convert';

import 'package:trips/utils/datetime_utils.dart';

class TripModel {
  String departureTime;
  String arrivalTime;
  String departureName;
  String arrivalName;
  String departurePlace;
  String arrivalPlace;
  String bus;
  String price;
  String routeNum;
  TripModel({
    required this.departureTime,
    required this.arrivalTime,
    required this.departureName,
    required this.arrivalName,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.bus,
    required this.price,
    required this.routeNum,
  });

  TripModel copyWith({
    String? departureTime,
    String? arrivalTime,
    String? departureName,
    String? arrivalName,
    String? departurePlace,
    String? arrivalPlace,
    String? bus,
    String? price,
    String? routeNum,
  }) {
    return TripModel(
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      departureName: departureName ?? this.departureName,
      arrivalName: arrivalName ?? this.arrivalName,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      bus: bus ?? this.bus,
      price: price ?? this.price,
      routeNum: routeNum ?? this.routeNum,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'departureTime': departureTime});
    result.addAll({'arrivalTime': arrivalTime});
    result.addAll({'departureName': departureName});
    result.addAll({'arrivalName': arrivalName});
    result.addAll({'departurePlace': departurePlace});
    result.addAll({'arrivalPlace': arrivalPlace});
    result.addAll({'bus': bus});
    result.addAll({'price': price});
    result.addAll({'routeNum': routeNum});

    return result;
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      departureTime: convertDatetime(map['DepartureTime'] ?? ''),
      arrivalTime: convertDatetime(map['ArrivalTime'] ?? ''),
      departureName: map['Departure']?['Name'] ?? '',
      arrivalName: map['Destination']?['Name'] ?? '',
      departurePlace: map['Departure']?['Address'] ?? '',
      arrivalPlace: map['Destination']?['Address'] ?? '',
      bus: map['Bus']?['Name'] ?? '',
      price: '${map['PassengerFareCost']} ${map['Currency']}',
      routeNum: map['RouteNum'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TripModel(departureTime: $departureTime, arrivalTime: $arrivalTime, departureName: $departureName, arrivalName: $arrivalName, departurePlace: $departurePlace, arrivalPlace: $arrivalPlace, bus: $bus, price: $price, routeNum: $routeNum)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TripModel &&
        other.departureTime == departureTime &&
        other.arrivalTime == arrivalTime &&
        other.departureName == departureName &&
        other.arrivalName == arrivalName &&
        other.departurePlace == departurePlace &&
        other.arrivalPlace == arrivalPlace &&
        other.bus == bus &&
        other.price == price &&
        other.routeNum == routeNum;
  }

  @override
  int get hashCode {
    return departureTime.hashCode ^
        arrivalTime.hashCode ^
        departureName.hashCode ^
        arrivalName.hashCode ^
        departurePlace.hashCode ^
        arrivalPlace.hashCode ^
        bus.hashCode ^
        price.hashCode ^
        routeNum.hashCode;
  }
}
