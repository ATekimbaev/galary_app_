import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/have_account/have_account_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/photo_bloc/photo_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/welcome_bloc/welcome_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/screens/create_account_page/create_account_screen.dart';
import 'package:gallary_app/%20feauture/presentation/theme/fonts.dart';
import 'package:gallary_app/%20feauture/presentation/widgets/app_button.dart';
import '../have_account_page/have_account_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 132,
                ),
                Image.asset(
                  'assets/images/icon.png',
                  width: 92,
                  height: 96,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Welcome!',
                  style: AppFonts.w500s20,
                ),
                const SizedBox(
                  height: 60,
                ),
                BlocConsumer<WelcomeBloc, WelcomeState>(
                  listener: (_, state) {
                    if (state is WelcomeCreateAccountState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((_) => BlocProvider.value(
                                value: context.read<PhotoBloc>(),
                                child: const CreateAccount(),
                              )),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        func: () =>
                            BlocProvider.of<WelcomeBloc>(context).add(WelcomeCreateAccountEvent()),
                        text: Text(
                          'Create an account',
                          style: AppFonts.w400s15.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.black);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<WelcomeBloc, WelcomeState>(
                  listener: (_, state) {
                    if (state is WelcomeHaveAccountState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider<HaveAccountBloc>.value(
                                  value: context.read<HaveAccountBloc>(),
                                  child: const HaveAccount(),
                                )),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        func: () {
                          BlocProvider.of<WelcomeBloc>(context).add(WelcomeHaveAccountEvent());
                        },
                        text: const Text('I already have an account', style: AppFonts.w400s15),
                        color: Colors.white);
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
