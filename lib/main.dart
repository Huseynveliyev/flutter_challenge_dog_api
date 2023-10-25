
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_dogs_by_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_random_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/presentation/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchRandomBreedCubit()),
        BlocProvider(create: (context) => FetchDogsByBreedCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter challenge ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MainPage()),
    );
  }
}
