import 'package:flutter/material.dart';
import 'package:iliski_kocu/screens/ProfileInfo/profile_info.dart';
import 'package:iliski_kocu/services/image_service.dart';
import 'package:iliski_kocu/theme/colors.dart';
import 'package:iliski_kocu/widgets/my_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageService.image('couple1')),
              SizedBox(height: 50),
              Text(
                'İlişkinizi Değerlendirin',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Yapay zeka desteği ile ilişkinizi test edin. Uzman ile konuşup tavsiyeler alın ve iletişim ipuçlarından faydalanın.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              MyButton(
                text: 'Devam Et',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfoScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
