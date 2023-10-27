import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/constant/app_lists.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_random_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/presentation/widgets/dropdown/dropdown.dart';
import '../../widgets/buttons/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Random Image by breed'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomDropDown(anyList: breedKeys),
          ),
          CustomButton(
            text: "Fetch",
            onPressed: () {
              // ApiService apiService = ApiService();
              // apiService.fetchSingleRandomBreed();
              context.read<RandomImageByBreedCubit>().fetchSingleRandomBreed();
              // DogRepository repository = getIt.get();
              // repository.fetchSingleRandomBreed();
            },
          ),
          BlocBuilder<RandomImageByBreedCubit, FetchRandomBreedState>(
            builder: (context, state) {
              if (state is FetchRandomBreedProgress) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is FetchRandomBreedFailure) {
                return Text(state.message.toString());
              } else if (state is FetchRandomBreedSuccess) {
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
}
