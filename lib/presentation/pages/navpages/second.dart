import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/app_lists.dart';
import '../../../data/cubits/fetch_dogs_by_breed_cubit.dart';
import '../../widgets/buttons/custom_button.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //selected Breed initial drowdown value
  String selectedBreed = 'akita';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //dog breed drop down
                    dropdown(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  text: "Images list by breed",
                  onPressed: () {
                    context.read<FetchDogsByBreedCubit>().fetchDogsByBreeds(breed: selectedBreed);
                  },
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<FetchDogsByBreedCubit, FetchDogsByBreedState>(
          builder: (context, state) {
            if (state is FetchDogsByBreedProgress) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: CupertinoActivityIndicator(),
              );
            } else if (state is FetchDogsByBreedFailure) {
              return Text(state.message.toString());
            } else if (state is FetchDogsByBreedSuccess) {
              final response = state.response;
              return Expanded(
                child: ListView.builder(
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
    );
  }

  //Dog breed drop down
  DropdownButton<String> dropdown() {
    return DropdownButton<String>(
      value: selectedBreed,
      items: dogBreeds.map((String breed) {
        return DropdownMenuItem<String>(
          value: breed,
          child: Text(breed),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedBreed = newValue!;
        });
      },
    );
  }
}
