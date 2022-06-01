import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/photo_bloc/photo_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/screens/main_screens/bottom_navigation_bar/bottom_bar.dart';
import 'package:gallary_app/%20feauture/presentation/theme/colors.dart';
import 'package:gallary_app/%20feauture/presentation/theme/fonts.dart';
import 'package:gallary_app/%20feauture/presentation/widgets/app_button.dart';
import 'package:gallary_app/%20feauture/presentation/widgets/input_widget.dart';

import '../../../data/dio_settings.dart';
import '../../../domain/repositories/photo_repo.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwoordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.violet),
        title: const Text(
          'Create account',
          style: AppFonts.w400s15,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              InputWidget(controller: userNameController, hintText: 'Username*'),
              const SizedBox(
                height: 10,
              ),
              InputWidget(controller: birthDayController, hintText: 'Birthday'),
              const SizedBox(
                height: 10,
              ),
              InputWidget(controller: emailController, hintText: 'E-mail*'),
              const SizedBox(
                height: 10,
              ),
              InputWidget(controller: passwoordController, hintText: 'Password*'),
              const SizedBox(
                height: 10,
              ),
              InputWidget(controller: confrimPasswordController, hintText: 'Confirm password*'),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                  func: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider<PhotoBloc>.value(
                          value: context.read<PhotoBloc>(),
                          child: const BottomBar(),
                        ),
                      ),
                    );
                  },
                  text: Text(
                    'Create account',
                    style: AppFonts.w400s15.copyWith(color: Colors.white),
                  ),
                  color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

}
