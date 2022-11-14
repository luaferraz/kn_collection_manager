import 'package:flutter/material.dart';

class AppTopBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppTopBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      // leading: leading,
      title: Text("Paolla"),
      // actions: actions,
    );
  }
}
