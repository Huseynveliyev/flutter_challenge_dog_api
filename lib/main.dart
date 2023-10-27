import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/cubits/cubit/image_by_breed_and_sub_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_dogs_by_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_random_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/presentation/pages/main_page.dart';

import 'data/cubits/cubit/image_list_by_breed_and_sub_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RandomImageByBreedCubit()),
        BlocProvider(create: (context) => ImageListByBreedCubit()),
        BlocProvider(create: (context) => RandomImageByBreedAndSubBreedCubit()),
        BlocProvider(create: (context) => ImageListByBreedAndSubBreedCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter challenge ',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainPage(),
      ),
    );
  }
}
