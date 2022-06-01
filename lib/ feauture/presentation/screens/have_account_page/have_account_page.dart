import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_app/%20feauture/data/dio_settings.dart';
import 'package:gallary_app/%20feauture/domain/repositories/photo_repo.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/have_account/have_account_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/screens/create_account_page/create_account_screen.dart';
import 'package:gallary_app/%20feauture/presentation/screens/main_screens/feed_screen/feed_screen.dart';
import 'package:gallary_app/%20feauture/presentation/theme/colors.dart';
import 'package:gallary_app/%20feauture/presentation/theme/fonts.dart';
import 'package:gallary_app/%20feauture/presentation/widgets/app_button.dart';
import '../../bloc/photo_bloc/photo_bloc.dart';
import '../../widgets/input_widget.dart';

class HaveAccount extends StatefulWidget {
  const HaveAccount({Key? key}) : super(key: key);

  @override
  State<HaveAccount> createState() => _HaveAccountState();
}

class _HaveAccountState extends State<HaveAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.violet),
        title: const Text(
          'Log in',
          style: AppFonts.w400s15,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            InputWidget(
              controller: emailController,
              hintText: 'E-mail',
            ),
            const SizedBox(
              height: 10,
            ),
            InputWidget(
              controller: passwordController,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 40,
            ),
            BlocProvider<HaveAccountBloc>.value(
              value: BlocProvider.of<HaveAccountBloc>(context),
              child: BlocConsumer<HaveAccountBloc, HaveAccountState>(
                listener: (_, state) {
                  if (state is LoginSuccesState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (_) => PhotoBloc(
                                  repo: PhotoRepo(
                                    dio: DioSettings().dio,
                                  ),
                                )..add(PhotoLoadEvent()),
                              ),
                            ],
                            child: const HomePage(),
                          )),
                    );
                  } 
                },
                builder: (context, state) {
                  return AppButton(
                      func: () {
                        BlocProvider.of<HaveAccountBloc>(context).add(LogInEvent(
                            email: emailController.text, password: passwordController.text));
                      },
                      text: Text(
                        'Log In',
                        style: AppFonts.w400s15.copyWith(color: Colors.white),
                      ),
                      color: Colors.black);
                },
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            BlocProvider<HaveAccountBloc>.value(
              value: BlocProvider.of<HaveAccountBloc>(context),
              child: BlocConsumer<HaveAccountBloc, HaveAccountState>(
                listener: (context, state) {
                  if (state is CreateAccountState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      BlocProvider.of<HaveAccountBloc>(context).add(CreateAccountEvent());
                    },
                    child: Text(
                      'Create account',
                      style: AppFonts.w400s15.copyWith(color: AppColors.pink),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
