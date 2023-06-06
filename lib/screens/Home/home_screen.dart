import 'package:flutter/material.dart';
import 'package:iliski_kocu/services/image_service.dart';
import 'package:iliski_kocu/theme/colors.dart';
import 'package:iliski_kocu/widgets/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hoş Geldiniz',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColors.primary),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'İlişkinizi değerlendirmeye başlayın',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: MyColors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColors.grey, width: 1),
                    ),
                    padding: EdgeInsets.all(3),
                    child: Icon(
                      Icons.settings,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.grey, width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: MyColors.primary.withOpacity(0.2),
                    child: Image.asset(
                      ImageService.icon('activity'),
                      height: 26,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Uzmana Danış',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Uzmana bağlanarak merak ettiğin ve öğrenmek istediğin tüm sorularını sorabilirsin.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.greyDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  MyButton(
                    color: MyColors.greyLightest,
                    textColor: MyColors.primary,
                    text: 'Sohbeti Başlat',
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.grey, width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: MyColors.primary.withOpacity(0.2),
                    child: Image.asset(
                      ImageService.icon('messages'),
                      height: 26,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'İlişki Değerlendirme',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Bu sayfada ilişkini değerlendirebilir ve ilişki seviyeni görebilirsin.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.greyDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  MyButton(
                    color: MyColors.greyLightest,
                    textColor: MyColors.primary,
                    text: 'Başlat',
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
