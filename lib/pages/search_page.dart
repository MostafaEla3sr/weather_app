import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data){
              cityName = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName : cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);

            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
              label: Text('Search'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              suffix: IconButton(
                onPressed: (){
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName : cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                  Navigator.pop(context);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
