import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_random_breed_cubit.dart';
import '../../widgets/buttons/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CustomButton(
            text: "Random Image by breed",
            onPressed: () {
              context.read<FetchRandomBreedCubit>().fetchSingleRandomBreed();
            },
          ),
        ),
        BlocBuilder<FetchRandomBreedCubit, FetchRandomBreedState>(
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  height: 400,
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
    );
  }
}
