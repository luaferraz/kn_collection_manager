import 'package:flutter/material.dart';
import 'package:kayou_cards/app.dart';
import 'package:kayou_cards/app/auth/data/datasources/auth_datasource.dart';
import 'package:kayou_cards/app/shared/themes/app_colors.dart';
import 'package:kayou_cards/app/shared/themes/app_dimens.dart';
import 'package:kayou_cards/app/shared/themes/app_text_styles.dart';
import 'package:kayou_cards/core/app_config.dart';
import 'package:kayou_cards/core/routes/app_routes.dart';
import 'package:kayou_cards/core/locators/service_locator.dart';

enum _MenuValues {
  logout,
  adm,
}

class AppTopBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppTopBarWidget({super.key});

  final authService = serviceLocator<AuthDatasource>();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      // leading: leading,
      title: Row(
        children: [
          AppConfig.WHERE_AM_I != ""
              ? Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.red,
                  ),
                  child: Text(
                    "${AppConfig.WHERE_AM_I}",
                    style: AppTextStyles.latoRegular(
                        size: 14, color: AppColors.white),
                  ),
                )
              : Container(),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (authService.currentUser.userName == "") {
              Navigator.pushNamed(context, AppRoutes.login);
            }
            if (authService.currentUser.userName == "lua") {
              Navigator.pushNamed(context, AppRoutes.adm);
            }
          },
          child: Row(
            children: [
              Text(
                authService.currentUser.userName,
                style: AppTextStyles.latoRegular(),
              ),
              SizedBox(width: AppDimens.space),
              CircleAvatar(
                backgroundColor: AppColors.lightGrey,
              )
            ],
          ),
        ),
      ],
    );
  }

  _dropDonwnMenuItem({_MenuValues? value, IconData? icon, String text = ""}) {
    PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          SizedBox(
            width: AppDimens.space,
          ),
          Text(
            text,
            style: AppTextStyles.latoBold(),
          ),
        ],
      ),
    );
  }
}
