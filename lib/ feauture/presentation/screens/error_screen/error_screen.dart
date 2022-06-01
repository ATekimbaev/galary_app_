import 'package:flutter/material.dart';
import 'package:gallary_app/%20feauture/presentation/theme/colors.dart';
import 'package:gallary_app/%20feauture/presentation/theme/fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 66,
        ),
        Image.asset(
          'assets/images/error_icon.png',
          height: 130,
          width: 130,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Oh shucks!',
          style: AppFonts.w500s20.copyWith(color: AppColors.violet),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Slow or no internet connection.\nPlease check your internet settings',
          style: AppFonts.w400s12.copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
