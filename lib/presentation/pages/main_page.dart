import 'package:flutter/material.dart';
import 'package:flutter_challenge_dog_api/presentation/widgets/bottom_bar/bottom_bar.dart';
import '../../constant/app_lists.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> bottomNavIndex = ValueNotifier<int>(0);
    return Scaffold(
      bottomNavigationBar: BottomBar(bottomNavIndex: bottomNavIndex),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.25),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Text(
            "Dog Api challenge",
          ),
        ),
      ),
      body: ValueListenableBuilder(
        builder: (context, value, child) => pages[bottomNavIndex.value],
        valueListenable: bottomNavIndex,
      ),
    );
  }
}
