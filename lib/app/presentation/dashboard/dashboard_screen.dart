import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kayou_cards/app/data/models/card_model.dart';
import 'package:kayou_cards/app/presentation/dashboard/dashboard_store.dart';
import 'package:kayou_cards/app/shared/themes/app_colors.dart';
import 'package:kayou_cards/app/shared/themes/app_dimens.dart';
import 'package:kayou_cards/app/shared/themes/app_text_styles.dart';
import 'package:kayou_cards/app/shared/widgets/app_top_bar_widget.dart';
import 'package:kayou_cards/core/helpers/loading_overlay.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardStore _dashboardStore = DashboardStore();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      LoadingOverlay.of(context)
          .during(_dashboardStore.loadCardList())
          .whenComplete(() => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWidget(
        title: "Dashboard",
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: EdgeInsets.all(AppDimens.space),
          child: _dashboardStore.cardList.length <= 0
              ? Container()
              : GridView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: _dashboardStore.cardList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 440,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return _cardView(_dashboardStore.cardList[index], index);
                  },
                ),
        );
      }),
    );
  }

  _cardView(CardModel card, int index) {
    return Container(
      height: 530,
      child: Column(children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(card.imgUrl != ""
                  ? card.imgUrl
                  : "https://picsum.photos/250?image=9"),
            ),
          ),
        ),
        Text(
          card.code,
          style: AppTextStyles.latoSemiBold(color: AppColors.white),
        )
      ]),
    );
  }
}
