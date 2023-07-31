import 'package:weather_app/models/weather_model.dart';

abstract class WeatherStates{}
class WeatherInitial extends WeatherStates{}
class WeatherLoading extends WeatherStates{}
class WeatherLoaded extends WeatherStates{
  WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}
class WeatherFailure extends WeatherStates{}