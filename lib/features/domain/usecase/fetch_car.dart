import 'package:car_rental/features/data/model/car.dart';
import 'package:car_rental/features/domain/repository/car_repository.dart';

class FetchCars {
  final CarRepository repository;
  FetchCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}