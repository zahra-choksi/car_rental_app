import 'package:car_rental/features/presentation/bloc/car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/car_state.dart';
import '../widgets/car_card_widgets.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc,CarState>(
        builder: (context,state){
          if(state is CarsLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is CarsLoaded){
            return ListView.builder(
              itemCount: state.cars.length,
                itemBuilder: (context,index){
                return CarCard(
                  car: state.cars[index]
                );
                }
            );
          } else if (state is CarError){
            return Center(
              child: Text(
                'error : ${state.message}'
              ),
            );
          }
          return Container();
        },
      )
    );
  }
}
