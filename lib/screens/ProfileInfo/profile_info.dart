import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iliski_kocu/screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:iliski_kocu/services/image_service.dart';
import 'package:iliski_kocu/services/secure_storage_service.dart';
import 'package:iliski_kocu/theme/colors.dart';
import 'package:iliski_kocu/widgets/bottom_dropdown.dart';
import 'package:iliski_kocu/widgets/my_button.dart';
import 'package:iliski_kocu/widgets/my_textfield.dart';
import 'package:intl/intl.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  Future<void> save() async {
    if (nameController.text.isNotEmpty) {
      await SecureStorageService().set(key: 'name', value: nameController.text);
    }
    if (birthDateController.text.isNotEmpty) {
      await SecureStorageService().set(key: 'birthDate', value: birthDateController.text);
    }
    if (genderController.text.isNotEmpty) {
      await SecureStorageService().set(key: 'gender', value: genderController.text);
    }
    if (relationshipController.text.isNotEmpty) {
      await SecureStorageService().set(key: 'relationship', value: relationshipController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Image.asset(ImageService.image('couple2')),
                SizedBox(height: 24),
                Text(
                  'Profil Bilgileri',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(
                  labelText: 'Ad soyad',
                  controller: nameController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  labelText: 'Doğum Tarihi',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  controller: birthDateController,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        birthDateController.text = DateFormat('dd.MM.yyyy').format(value);
                      });
                    });
                  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  labelText: 'Cinsiyet',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  controller: genderController,
                  readOnly: true,
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => BottomDropdown(
                        options: ['Erkek', 'Kadın'],
                        onSelected: (val) {
                          genderController.text = val;
                          setState(() {});
                        },
                        selecteds: [genderController.text],
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  labelText: 'İlişki Durumu',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  controller: relationshipController,
                  readOnly: true,
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => BottomDropdown(
                        options: ['Evli', 'Bekar', 'Nişanlı', 'Sevgili', 'Dul'],
                        onSelected: (val) {
                          relationshipController.text = val;
                          setState(() {});
                        },
                        selecteds: [relationshipController.text],
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                MyButton(
                  color: MyColors.greyLightest,
                  textColor: MyColors.primary,
                  text: 'Atla',
                  onPressed: () async {
                    await save();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBar()), (route) => false);
                  },
                ),
                SizedBox(height: 10),
                MyButton(
                  text: 'Devam Et',
                  onPressed: () async {
                    await save();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBar()), (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
