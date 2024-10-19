import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:ecommerce_project_main/widgets/Categorey_icon_item_chip.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 44, right: 44, bottom: 32, top: 32),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                    const Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'حساب کاربری',
                        style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 16,
                          color: CustomColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'ابوالفضل قاسمی',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const Text(
              '09100338055',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                  fontFamily: 'sm', fontSize: 15, color: CustomColors.gery),
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(
                  fontFamily: 'sm', fontSize: 15, color: CustomColors.gery),
            ),
            const Text(
              'instagram.com/mojava-dev',
              style: TextStyle(
                  fontFamily: 'sm', fontSize: 15, color: CustomColors.gery),
            ),
          ],
        ),
      ),
    );
  }
}
