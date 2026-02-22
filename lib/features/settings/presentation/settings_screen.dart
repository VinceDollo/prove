import 'package:flutter/material.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';
import 'package:flutter_starter/shared/widgets/version_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final cs = Theme.of(context).colorScheme;

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
                    style: AppTextStyles.labelLarge.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.paddingXL),
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
                  Text(
                    'System.',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'Light.',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'Dark.',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: cs.onSurfaceVariant,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.paddingXL),
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
                  )
                ],
              ),
              const SizedBox(height: AppDimensions.paddingXL),
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
