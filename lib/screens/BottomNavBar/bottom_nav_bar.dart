import 'package:flutter/material.dart';
import 'package:iliski_kocu/screens/Home/home_screen.dart';
import 'package:iliski_kocu/screens/Tips/tips_screen.dart';
import 'package:iliski_kocu/services/image_service.dart';
import 'package:iliski_kocu/theme/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeScreen(),
      TipsScreen(),
      Container(
        color: Colors.green,
      ),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedLabelStyle: TextStyle(color: MyColors.grey, fontWeight: FontWeight.normal),
        selectedLabelStyle: TextStyle(color: MyColors.primary, fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(icon: BottomNavBarImage(image: 'home', selected: currentIndex == 0), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: BottomNavBarImage(image: 'message-question', selected: currentIndex == 1), label: 'İletişim İpuçları'),
          BottomNavigationBarItem(icon: BottomNavBarImage(image: 'user', selected: currentIndex == 2), label: 'Profil'),
        ],
      ),
    );
  }
}

class BottomNavBarImage extends StatelessWidget {
  const BottomNavBarImage({
    super.key,
    required this.image,
    required this.selected,
  });

  final String image;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Image.asset(
        ImageService.icon(image),
        color: selected ? MyColors.primary : MyColors.grey,
        scale: 2,
      ),
    );
  }
}
