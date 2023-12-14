import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../configs/all_configs.dart';
import '../../../widgets/all_widgets.dart';
import '../../authorization/x_authorizations.dart';
import '../x_profiles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBackButton: false,
      toolbarHeight: 110.0,
      appBarTitle: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Image.network(
              'https://i.pravatar.cc/200',
              width: 64.0,
              height: 64.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: context.deviceWidth - 160.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<AuthorizationModel>(
                    future: AuthorizationService.getAuthData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          'Hallo, ${snapshot.data!.user.name}',
                          style: TextStyle(
                            color: kWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.pushAndRemoveUntil(const LoginView(), (route) => false);
            },
            icon: Icon(Icons.logout, size: 24),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          ProfileMenu(
            label: 'Edit Profile',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Help',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Privacy & Policy',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Term of Service',
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          ProfileMenu(
            label: 'Logout',
            onPressed: () {
              context.read<SignoutBloc>().add(GetSignout());
              AuthorizationService.removeAuthData();
              context.pushReplacement(const LoginView());
            },
          ),
        ],
      ),
    );
  }
}
