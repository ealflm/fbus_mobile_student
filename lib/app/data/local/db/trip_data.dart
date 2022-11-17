import '../../models/trip_model.dart';

Map<String, Trip> getTrips() {
  Map<String, Trip> result = {};

  result['0'] = Trip(
    id: '0',
    startTime: DateTime(2022, 11, 14, 6, 30),
    endTime: DateTime(2022, 11, 14, 7, 30),
    seats: 20,
  );

  result['1'] = Trip(
    id: '1',
    startTime: DateTime(2022, 11, 15, 6, 30),
    endTime: DateTime(2022, 11, 15, 7, 30),
    seats: 25,
  );

  result['2'] = Trip(
    id: '2',
    startTime: DateTime(2022, 11, 16, 6, 30),
    endTime: DateTime(2022, 11, 16, 7, 30),
    seats: 18,
  );

  result['3'] = Trip(
    id: '3',
    startTime: DateTime(2022, 11, 17, 6, 30),
    endTime: DateTime(2022, 11, 17, 7, 30),
    seats: 10,
  );

  result['4'] = Trip(
    id: '4',
    startTime: DateTime(2022, 11, 18, 6, 30),
    endTime: DateTime(2022, 11, 18, 7, 30),
    seats: 28,
  );

  result['4.1'] = Trip(
    id: '4.1',
    startTime: DateTime(2022, 11, 19, 6, 30),
    endTime: DateTime(2022, 11, 19, 7, 30),
    seats: 40,
  );

  // Another

  result['5'] = Trip(
    id: '5',
    startTime: DateTime(2022, 11, 14, 13, 30),
    endTime: DateTime(2022, 11, 14, 14, 30),
    seats: 24,
  );

  result['6'] = Trip(
    id: '6',
    startTime: DateTime(2022, 11, 15, 13, 30),
    endTime: DateTime(2022, 11, 15, 14, 30),
    seats: 14,
  );

  result['7'] = Trip(
    id: '7',
    startTime: DateTime(2022, 11, 16, 13, 30),
    endTime: DateTime(2022, 11, 16, 14, 30),
    seats: 31,
  );

  result['8'] = Trip(
    id: '8',
    startTime: DateTime(2022, 11, 17, 13, 30),
    endTime: DateTime(2022, 11, 17, 14, 30),
    seats: 35,
  );

  result['9'] = Trip(
    id: '9',
    startTime: DateTime(2022, 11, 18, 13, 30),
    endTime: DateTime(2022, 11, 18, 14, 30),
    seats: 32,
  );

  result['9.1'] = Trip(
    id: '9.1',
    startTime: DateTime(2022, 11, 19, 13, 30),
    endTime: DateTime(2022, 11, 19, 14, 30),
    seats: 32,
  );

  /////

  result['10'] = Trip(
    id: '10',
    startTime: DateTime(2022, 11, 21, 6, 30),
    endTime: DateTime(2022, 11, 21, 7, 30),
    seats: 40,
  );

  result['11'] = Trip(
    id: '11',
    startTime: DateTime(2022, 11, 22, 6, 30),
    endTime: DateTime(2022, 11, 22, 7, 30),
    seats: 31,
  );

  result['12'] = Trip(
    id: '12',
    startTime: DateTime(2022, 11, 23, 6, 30),
    endTime: DateTime(2022, 11, 23, 7, 30),
    seats: 24,
  );

  result['13'] = Trip(
    id: '13',
    startTime: DateTime(2022, 11, 24, 6, 30),
    endTime: DateTime(2022, 11, 24, 7, 30),
    seats: 40,
  );

  result['14'] = Trip(
    id: '14',
    startTime: DateTime(2022, 11, 25, 6, 30),
    endTime: DateTime(2022, 11, 25, 7, 30),
    seats: 24,
  );

  result['14.1'] = Trip(
    id: '14.1',
    startTime: DateTime(2022, 11, 26, 6, 30),
    endTime: DateTime(2022, 11, 26, 7, 30),
    seats: 31,
  );

  // Another

  result['15'] = Trip(
    id: '15',
    startTime: DateTime(2022, 11, 21, 13, 30),
    endTime: DateTime(2022, 11, 21, 14, 30),
    seats: 40,
  );

  result['16'] = Trip(
    id: '16',
    startTime: DateTime(2022, 11, 22, 13, 30),
    endTime: DateTime(2022, 11, 22, 14, 30),
    seats: 21,
  );

  result['17'] = Trip(
    id: '17',
    startTime: DateTime(2022, 11, 23, 13, 30),
    endTime: DateTime(2022, 11, 23, 14, 30),
    seats: 5,
  );

  result['18'] = Trip(
    id: '18',
    startTime: DateTime(2022, 11, 24, 13, 30),
    endTime: DateTime(2022, 11, 24, 14, 30),
    seats: 7,
  );

  result['19'] = Trip(
    id: '19',
    startTime: DateTime(2022, 11, 25, 13, 30),
    endTime: DateTime(2022, 11, 25, 14, 30),
    seats: 9,
  );

  result['19.1'] = Trip(
    id: '19.1',
    startTime: DateTime(2022, 11, 26, 13, 30),
    endTime: DateTime(2022, 11, 26, 14, 30),
    seats: 9,
  );

  return result;
}
