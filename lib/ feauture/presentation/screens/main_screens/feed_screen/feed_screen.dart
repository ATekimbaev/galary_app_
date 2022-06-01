import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/bloc/photo_bloc/photo_bloc.dart';
import 'package:gallary_app/%20feauture/presentation/screens/main_screens/feed_screen/tab_new_screen.dart';
import 'package:gallary_app/%20feauture/presentation/theme/colors.dart';
import 'package:gallary_app/%20feauture/presentation/theme/fonts.dart';

import '../../error_screen/error_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('home page'),
            bottom: const TabBar(
              labelColor: Colors.black,
              labelStyle: AppFonts.w500s20,
              unselectedLabelColor: AppColors.grey,
              indicatorColor: AppColors.pink,
              tabs: [
                Text('New'),
                Text('Popular'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [TabNew(), ErrorScreen()],
          )),
    );
  }
}
