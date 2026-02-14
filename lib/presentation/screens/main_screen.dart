import 'package:flutter/material.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.initialTabsLastPath,
    required this.child,
    Key? key,
  }) : super(key: key);
  static const String routeName = 'screen_1';
  final List<String> initialTabsLastPath;
  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            child: BottomNavigationBar(
              items: [
                item(
                  0,
                  Assets.icHome,
                  Assets.icHomeUnselected,
                  S.of(context).tab1,
                ),
                item(
                  1,
                  Assets.icHome,
                  Assets.icHomeUnselected,
                  S.of(context).tab2,
                ),
                item(
                  2,
                  Assets.icHome,
                  Assets.icHomeUnselected,
                  S.of(context).tab3,
                ),
                item(
                  3,
                  Assets.icHome,
                  Assets.icHomeUnselected,
                  S.of(context).tab4,
                ),
                item(
                  4,
                  Assets.icHome,
                  Assets.icHomeUnselected,
                  S.of(context).tab5,
                ),
              ],
              // selectedLabelStyle: AppTextStyles.captionC2Bold,
              // unselectedLabelStyle: AppTextStyles.captionC2Semibold,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              // selectedItemColor: AppColors.vert_accessible,
              // unselectedItemColor: AppColors.noir_tanguy,
              iconSize: 40,
              type: BottomNavigationBarType.fixed,
              currentIndex: activeIndex,
              onTap: (index) {
                context.go(widget.initialTabsLastPath[index]);
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  String getTitle(int activeIndex) {
    if (activeIndex == 0) {
      return S.of(context).tab1;
    } else if (activeIndex == 1) {
      return S.of(context).tab2;
    } else if (activeIndex == 2) {
      return S.of(context).tab3;
    } else if (activeIndex == 3) {
      return S.of(context).tab4;
    } else if (activeIndex == 4) {
      return S.of(context).tab5;
    } else {
      return '';
    }
  }

  BottomNavigationBarItem item(
    int index,
    Widget asset,
    Widget assetUnselected,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: index == activeIndex ? asset : assetUnselected,
        ),
      ),
      label: label,
    );
  }
}
