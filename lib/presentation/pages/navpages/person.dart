import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/cubits/cubit/image_list_by_breed_and_sub_cubit.dart';

import 'package:flutter_challenge_dog_api/presentation/widgets/buttons/custom_button.dart';

import '../../../constant/app_lists.dart';

String? selectedBreed;
String? selectedSubBreed;

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _MyAppState();
}

class _MyAppState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Image List by breed and sub breed"),
          const SizedBox(height: 20),
          //breed drop down
          buildBreedDropdown(),
          const SizedBox(height: 20),
          if (selectedBreed != null && breedData[selectedBreed]!.isNotEmpty)
            //sub-breed dropdown list
            buildSubBreedDropDown(),

          const SizedBox(height: 20),
          CustomButton(
              text: "Fetch",
              onPressed: () {
                if (selectedBreed != null &&
                    selectedSubBreed != null &&
                    selectedSubBreed!.isNotEmpty &&
                    selectedBreed!.isNotEmpty) {
                  context.read<ImageListByBreedAndSubBreedCubit>().imageListByBreedAndSubBreed(
                      selectedBreed: selectedBreed!, selectedSubBreed: selectedSubBreed!);

                  selectedBreed = null;
                  selectedSubBreed = null;
                }
              }),

          BlocBuilder<ImageListByBreedAndSubBreedCubit, ImageListByBreedAndSubState>(
            builder: (context, state) {
              if (state is ImageListByBreedAndSubProgress) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is ImageListByBreedAndSubFailure) {
                return Text(state.message.toString());
              } else if (state is ImageListByBreedAndSubSuccess) {
                final response = state.response;
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(18),
                    physics: const BouncingScrollPhysics(),
                    itemCount: response.message!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: 300,
                        height: 300,
                        child: Image.network(
                          response.message![index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
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
          value: selectedSubBreed,
          hint: const Text("Select Sub-Breed"),
          onChanged: (newValue) {
            setState(() {
              selectedSubBreed = newValue!;
              // nullable değer için atama
            });
          },
          items: breedData[selectedBreed]!.map((subBreed) {
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

  SizedBox buildBreedDropdown() {
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
          value: selectedBreed,
          hint: const Text("Select Breed"),
          onChanged: (newValue) {
            setState(() {});
            selectedBreed = newValue!;

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
