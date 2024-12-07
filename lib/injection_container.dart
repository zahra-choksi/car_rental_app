import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'features/data/datasource/firebase_car_data_source.dart';
import 'features/data/repository/car_repository_impl.dart';
import 'features/domain/repository/car_repository.dart';
import 'features/domain/usecase/fetch_car.dart';
import 'features/presentation/bloc/car_bloc.dart';


GetIt getIt = GetIt.instance;

void initInjection(){
  try{
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
            () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );
    getIt.registerLazySingleton<CarRepository>(
            () => CarRepositoryImpl(getIt<FirebaseCarDataSource>())
    );
    getIt.registerLazySingleton<FetchCars>(
            () => FetchCars(getIt<CarRepository>())
    );
    getIt.registerFactory(() => CarBloc(
        fetchCars: getIt<FetchCars>()));

  } catch (e){
    rethrow;
  }
}