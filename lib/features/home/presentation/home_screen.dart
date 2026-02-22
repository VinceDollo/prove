import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/core/assets/assetsGen/fonts.gen.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';
import 'package:flutter_starter/features/home/presentation/providers/sentence_notifier.dart';
import 'package:flutter_starter/features/home/presentation/widgets/liked_button_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sentence = ref.watch(sentenceProvider);

    if (sentence.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (sentence.hasError) {
      return const Center(
        child: Text("Error"),
      );
    }

    final height = MediaQuery.sizeOf(context).height;
    final cs = Theme.of(context).colorScheme;
    final date = DateFormat('MMMM d, yyyy').format(DateTime.now()).toUpperCase();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingXL),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
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
              if (sentence.value == null)
                Align(
                  child: Text(
                    'No sentence for today.',
                    style: AppTextStyles.bodyMedium.copyWith(color: cs.onSurfaceVariant),
                  ),
                )
              else
                Align(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '"${sentence.value!.sentence}"',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: cs.onSurface,
                          fontFamily: FontFamily.regular,
                          fontStyle: FontStyle.italic,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.paddingL),
                      SizedBox(
                        width: 30,
                        child: Divider(color: cs.onSurface, thickness: 1, height: 1),
                      ),
                      const SizedBox(height: AppDimensions.paddingL),
                      Text(
                        date,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: cs.onSurfaceVariant,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 100),
                      LikeButtonWidget(sentence: sentence.value!),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
