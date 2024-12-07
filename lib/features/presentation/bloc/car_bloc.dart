import 'package:bloc/bloc.dart';
import '../../domain/usecase/fetch_car.dart';
import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FetchCars fetchCars;
  CarBloc({
    required this.fetchCars
}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try{
        final cars = await fetchCars.call();
        emit(CarsLoaded(cars));
      } catch(e){
        emit(CarError(e.toString()));
      }
    });
  }
}
