import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/cubits/cubit/image_by_breed_and_sub_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/presentation/widgets/buttons/custom_button.dart';


import '../../../constant/app_lists.dart';

String? selectedBreeds;
String? selectedSubBreeds;

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _MyAppState();
}

class _MyAppState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Random image by breed and sub breed"),
          const SizedBox(height: 20),
          //breed drop down list
          buildBreedDropDown(),
          const SizedBox(height: 15),
          if (selectedBreeds != null && breedData[selectedBreeds!]!.isNotEmpty)
            //sub-breed dropdown list
            buildSubBreedDropDown(),
          const SizedBox(height: 25),
          CustomButton(
              text: "Fetch",
              onPressed: () {
                if (selectedBreeds != null &&
                    selectedSubBreeds != null &&
                    selectedSubBreeds!.isNotEmpty &&
                    selectedBreeds!.isNotEmpty) {
                  context
                      .read<RandomImageByBreedAndSubBreedCubit>()
                      .fetchImageByBreedAndSub(selectedBreed: selectedBreeds!, selectedSubBreed: selectedSubBreeds!);
                  selectedBreeds = null;
                  selectedSubBreeds = null;
                }
              }),
            // 
          BlocBuilder<RandomImageByBreedAndSubBreedCubit, ImageByBreedAndSubBreedState>(
            builder: (context, state) {
              if (state is ImageByBreedAndSubBreedProgress) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is ImageByBreedAndSubBreedFailure) {
                return Text(state.message.toString());
              } else if (state is ImageByBreedAndSubBreedSuccess) {
                final response = state.response;
                return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 300,
                    height: 300,
                    child: Image.network(
                      response.message ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  SizedBox buildSubBreedDropDown() {
    return SizedBox(
            width: 180,
            height: 60,
            child: InputDecorator(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              )),
              child: DropdownButton<String>(
                underline: Container(),
                value: selectedSubBreeds,
                hint: const Text("Select Sub-Breed"),
                onChanged: (newValue) {
                  setState(() {
                    selectedSubBreeds = newValue!;
                    // nullable değer için atama
                  });
                },
                items: breedData[selectedBreeds]!.map((subBreed) {
                  // nullable değeri kontrol et
                  return DropdownMenuItem(
                    value: subBreed,
                    child: Text(subBreed),
                  );
                }).toList(),
              ),
            ),
          );
  }

  SizedBox buildBreedDropDown() {
    return SizedBox(
          width: 180,
          height: 60,
          child: InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            )),
            child: DropdownButton<String>(
              underline: Container(),
              value: selectedBreeds,
              hint: const Text("Select Breed"),
              onChanged: (newValue) {
                setState(() {});
                selectedBreeds = newValue!;

                // selectedSubBreeds = null;
              },
              items: breedData.keys.map((breed) {
                return DropdownMenuItem(
                  value: breed,
                  child: Text(breed),
                );
              }).toList(),
            ),
          ),
        );
  }
}
