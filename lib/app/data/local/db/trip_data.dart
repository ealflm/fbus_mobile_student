import '../../models/trip_model.dart';

Map<String, Trip> getTrips() {
  Map<String, Trip> result = {};

  result['0'] = Trip(
    id: '0',
    startTime: DateTime(2022, 11, 28, 6, 30),
    endTime: DateTime(2022, 11, 28, 7, 30),
    seats: 20,
  );

  result['1'] = Trip(
    id: '1',
    startTime: DateTime(2022, 11, 29, 6, 30),
    endTime: DateTime(2022, 11, 29, 7, 30),
    seats: 25,
  );

  result['2'] = Trip(
    id: '2',
    startTime: DateTime(2022, 11, 30, 6, 30),
    endTime: DateTime(2022, 11, 30, 7, 30),
    seats: 18,
  );

  result['3'] = Trip(
    id: '3',
    startTime: DateTime(2022, 12, 1, 6, 30),
    endTime: DateTime(2022, 12, 1, 7, 30),
    seats: 10,
  );

  result['4'] = Trip(
    id: '4',
    startTime: DateTime(2022, 12, 2, 6, 30),
    endTime: DateTime(2022, 12, 2, 7, 30),
    seats: 28,
  );

  result['4.1'] = Trip(
    id: '4.1',
    startTime: DateTime(2022, 12, 3, 6, 30),
    endTime: DateTime(2022, 12, 3, 7, 30),
    seats: 40,
  );

  // Another

  result['5'] = Trip(
    id: '5',
    startTime: DateTime(2022, 11, 28, 13, 30),
    endTime: DateTime(2022, 11, 28, 14, 30),
    seats: 24,
  );

  result['6'] = Trip(
    id: '6',
    startTime: DateTime(2022, 11, 29, 13, 30),
    endTime: DateTime(2022, 11, 29, 14, 30),
    seats: 14,
  );

  result['7'] = Trip(
    id: '7',
    startTime: DateTime(2022, 11, 30, 13, 30),
    endTime: DateTime(2022, 11, 30, 14, 30),
    seats: 31,
  );

  result['8'] = Trip(
    id: '8',
    startTime: DateTime(2022, 12, 1, 13, 30),
    endTime: DateTime(2022, 12, 1, 14, 30),
    seats: 35,
  );

  result['9'] = Trip(
    id: '9',
    startTime: DateTime(2022, 12, 2, 13, 30),
    endTime: DateTime(2022, 12, 2, 14, 30),
    seats: 32,
  );

  result['9.1'] = Trip(
    id: '9.1',
    startTime: DateTime(2022, 12, 3, 13, 30),
    endTime: DateTime(2022, 12, 3, 14, 30),
    seats: 32,
  );

  /////

  result['10'] = Trip(
    id: '10',
    startTime: DateTime(2022, 12, 5, 6, 30),
    endTime: DateTime(2022, 12, 5, 7, 30),
    seats: 40,
  );

  result['11'] = Trip(
    id: '11',
    startTime: DateTime(2022, 12, 6, 6, 30),
    endTime: DateTime(2022, 12, 6, 7, 30),
    seats: 31,
  );

  result['12'] = Trip(
    id: '12',
    startTime: DateTime(2022, 12, 7, 6, 30),
    endTime: DateTime(2022, 12, 7, 7, 30),
    seats: 24,
  );

  result['13'] = Trip(
    id: '13',
    startTime: DateTime(2022, 12, 8, 6, 30),
    endTime: DateTime(2022, 12, 8, 7, 30),
    seats: 40,
  );

  result['14'] = Trip(
    id: '14',
    startTime: DateTime(2022, 12, 9, 6, 30),
    endTime: DateTime(2022, 12, 9, 7, 30),
    seats: 24,
  );

  result['14.1'] = Trip(
    id: '14.1',
    startTime: DateTime(2022, 12, 10, 6, 30),
    endTime: DateTime(2022, 12, 10, 7, 30),
    seats: 31,
  );

  // Another

  result['15'] = Trip(
    id: '15',
    startTime: DateTime(2022, 12, 5, 13, 30),
    endTime: DateTime(2022, 12, 5, 14, 30),
    seats: 40,
  );

  result['16'] = Trip(
    id: '16',
    startTime: DateTime(2022, 12, 6, 13, 30),
    endTime: DateTime(2022, 12, 6, 14, 30),
    seats: 21,
  );

  result['17'] = Trip(
    id: '17',
    startTime: DateTime(2022, 12, 7, 13, 30),
    endTime: DateTime(2022, 12, 7, 14, 30),
    seats: 5,
  );

  result['18'] = Trip(
    id: '18',
    startTime: DateTime(2022, 12, 8, 13, 30),
    endTime: DateTime(2022, 12, 8, 14, 30),
    seats: 7,
  );

  result['19'] = Trip(
    id: '19',
    startTime: DateTime(2022, 12, 9, 13, 30),
    endTime: DateTime(2022, 12, 9, 14, 30),
    seats: 9,
  );

  result['19.1'] = Trip(
    id: '19.1',
    startTime: DateTime(2022, 12, 10, 13, 30),
    endTime: DateTime(2022, 12, 10, 14, 30),
    seats: 9,
  );

  return result;
}
