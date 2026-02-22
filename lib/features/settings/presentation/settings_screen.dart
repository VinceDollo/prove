import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';
import 'package:flutter_starter/features/settings/presentation/providers/theme_notifier.dart';
import 'package:flutter_starter/shared/widgets/version_widget.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;
    final cs = Theme.of(context).colorScheme;
    final currentMode = ref.watch(themeModeProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: Text(
                    'Prove.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingXXL),
              Text(
                'Theme.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ThemeOption(
                    label: 'System.',
                    isSelected: currentMode == ThemeMode.system,
                    onTap: () => ref.read(themeModeProvider.notifier).themeMode = ThemeMode.system,
                  ),
                  _ThemeOption(
                    label: 'Light.',
                    isSelected: currentMode == ThemeMode.light,
                    onTap: () => ref.read(themeModeProvider.notifier).themeMode = ThemeMode.light,
                  ),
                  _ThemeOption(
                    label: 'Dark.',
                    isSelected: currentMode == ThemeMode.dark,
                    onTap: () => ref.read(themeModeProvider.notifier).themeMode = ThemeMode.dark,
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.paddingXXL),
              Text(
                'Notification.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Push.',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.paddingXXL),
              Text(
                'CGU.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Politique de confidentialité.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Mentions légales.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: AppDimensions.paddingXL),
              const Center(child: VersionWidget()),
              const SizedBox(height: AppDimensions.paddingXL),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.titleMedium.copyWith(
              color: isSelected ? cs.onSurface : cs.onSurfaceVariant,
              letterSpacing: 2,
            ),
          ),
          if (isSelected)
            Container(
              height: 3,
              width: 40,
              color: cs.onSurface,
            ),
        ],
      ),
    );
  }
}
