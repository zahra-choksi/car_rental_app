import 'package:car_rental/features/data/datasource/firebase_car_data_source.dart';
import 'package:car_rental/features/data/model/car.dart';
import 'package:car_rental/features/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository{
  final FirebaseCarDataSource dataSource;
  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() async {
    return await dataSource.fetchCars();
  }

}