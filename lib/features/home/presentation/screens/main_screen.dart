import 'package:flutter/material.dart';
import 'package:flutter_starter/core/assets/assetsGen/assets.gen.dart';
import 'package:flutter_starter/core/localization/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.initialTabsLastPath,
    required this.child,
    super.key,
  });
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
                  Assets.lib.core.assets.images.icHome.svg(),
                  Assets.lib.core.assets.images.icHomeUnselected.svg(),
                  S.of(context).tab1,
                ),
                item(
                  1,
                  Assets.lib.core.assets.images.icHome.svg(),
                  Assets.lib.core.assets.images.icHomeUnselected.svg(),
                  S.of(context).tab2,
                ),
              ],
              showSelectedLabels: true,
              showUnselectedLabels: true,
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
