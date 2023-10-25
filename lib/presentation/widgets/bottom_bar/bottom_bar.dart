import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.bottomNavIndex,
  });

  final ValueNotifier<int> bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        bottomNavIndex.value = index;
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: bottomNavIndex.value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.house,),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: ''),
      ],
    );
  }
}
