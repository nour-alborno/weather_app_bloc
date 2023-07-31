

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';



Container SuccessWidget(BuildContext context, WeatherModel weatherData) {

  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData.getThemeColor(),
            weatherData.getThemeColor()[300]!,
            weatherData.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        Text(
         BlocProvider.of<WeatherCubit>(context).cityName!,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData!.getImage()),
            Text(
              weatherData!.temp.toInt().toString(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                Text('minTemp : ${weatherData!.minTemp.toInt()}'),
              ],
            ),
          ],
        ),
        Spacer(),
        Text(
          weatherData!.weatherStateName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(
          flex: 5,
        ),
      ],
    ),
  );
}