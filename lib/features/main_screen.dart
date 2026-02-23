import 'package:flutter/material.dart';
import 'package:flutter_starter/core/assets/assetsGen/assets.gen.dart';
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
    final cs = Theme.of(context).colorScheme;
    final selectedFilter = ColorFilter.mode(cs.primary, BlendMode.srcIn);
    final unselectedFilter = ColorFilter.mode(cs.onSurfaceVariant, BlendMode.srcIn);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          Visibility(
            child: BottomNavigationBar(
              items: [
                _item(
                  0,
                  Assets.lib.core.assets.images.homeSolid.svg(colorFilter: selectedFilter),
                  Assets.lib.core.assets.images.homeOutline.svg(colorFilter: unselectedFilter),
                  'Home',
                ),
                _item(
                  1,
                  Assets.lib.core.assets.images.settingSolid.svg(colorFilter: selectedFilter),
                  Assets.lib.core.assets.images.settingOutline.svg(colorFilter: unselectedFilter),
                  'Settings',
                ),
                _item(
                  2,
                  Assets.lib.core.assets.images.homeSolid.svg(colorFilter: selectedFilter),
                  Assets.lib.core.assets.images.homeOutline.svg(colorFilter: unselectedFilter),
                  'Design',
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

  BottomNavigationBarItem _item(
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
