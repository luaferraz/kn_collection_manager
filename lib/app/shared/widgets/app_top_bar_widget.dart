import 'package:flutter/material.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';

class AppTopBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppTopBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      // leading: leading,
      title: Text("oi"),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
          child: CircleAvatar(),
        )
      ],
    );
  }
}
