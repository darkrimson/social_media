import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/domain/entitites/app_user.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();

  late AppUser? currentUser = authCubit.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser!.email),
      ),
    );
  }
}
