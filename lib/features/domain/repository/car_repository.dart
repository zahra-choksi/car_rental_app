import 'package:car_rental/features/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}