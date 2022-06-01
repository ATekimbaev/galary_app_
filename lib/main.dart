import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_app/%20feauture/data/dio_settings.dart';
import 'package:gallary_app/%20feauture/domain/repositories/create_user_repo.dart';
import 'package:gallary_app/%20feauture/domain/repositories/photo_repo.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/create_account/create_account_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/have_account/have_account_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/photo_bloc/photo_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/welcome_bloc/welcome_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/screens/welcome_page/welcome_screen.dart';
import ' feauture/domain/repositories/login_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              LoginRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => CreateUserRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) =>
              PhotoRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) =>
              LoginRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        )
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider<HaveAccountBloc>(
          create: (context) => HaveAccountBloc(
            repo: RepositoryProvider.of<LoginRepo>(context),
          ),
        ),
        BlocProvider<CreateAccountBloc>(
          create: (context) => CreateAccountBloc(
            repo: RepositoryProvider.of<CreateUserRepo>(context),
          ),
        ),
        BlocProvider(
          create: (context) => PhotoBloc(
            repo: context.read<PhotoRepo>(),
          )..add(PhotoLoadEvent()),
        ),
      ], child: child),
    );
  }
}
