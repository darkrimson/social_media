import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/profile/presentation/pages/profile_page.dart';

import '../../../auth/presentation/cubits/auth_cubit.dart';
import 'my_drawer_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Divider(color: Theme.of(context).colorScheme.secondary),

              // домашняя страница
              MyDrawerTitle(
                icon: Icons.home,
                title: "Главная",
                onTap: () => Navigator.of(context).pop(),
              ),
              MyDrawerTitle(
                icon: Icons.home,
                title: "Профиль",
                onTap: () {
                  Navigator.of(context).pop();

                  final user = context.read<AuthCubit>().currentUser;
                  String uid = user!.uid;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        uid: uid,
                      ),
                    ),
                  );
                },
              ),
              MyDrawerTitle(
                icon: Icons.home,
                title: "Поиск",
                onTap: () {},
              ),
              MyDrawerTitle(
                icon: Icons.home,
                title: "Настройки",
                onTap: () {},
              ),

              const Spacer(),

              MyDrawerTitle(
                icon: Icons.home,
                title: "Выход",
                onTap: () => context.read<AuthCubit>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
