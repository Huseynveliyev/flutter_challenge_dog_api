import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/presentation/widgets/dropdown/dropdown.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Images list by breed"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomDropDown(
                  anyList: breedKeys,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
            text: "Fetch",
            onPressed: () {
              context.read<ImageListByBreedCubit>().fetchDogsByBreeds();
            },
          ),
        ),
        BlocBuilder<ImageListByBreedCubit, FetchDogsByBreedState>(
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
    );
  }
}
