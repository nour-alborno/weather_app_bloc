import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';


import '../widgets/failure_widget.dart';
import '../widgets/success_widget.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(

                );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit,WeatherStates>(builder: (context, state) {
        if(state is WeatherLoading){
          return Center(child: CircularProgressIndicator(),);
        } else if (state is WeatherLoaded){
        weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return  SuccessWidget(context, state.weatherModel);
        } else if(state is WeatherFailure) {
          return failure_widget();
        } else {
          return Center(child: Text("Initial State",style: TextStyle(fontSize: 20),),);
        }
      },)
    );
  }




}
