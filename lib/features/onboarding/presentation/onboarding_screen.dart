import 'package:flutter/material.dart';
import 'package:flutter_starter/core/assets/assetsGen/fonts.gen.dart';
import 'package:flutter_starter/core/utils/instance_get_it.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';
import 'package:flutter_starter/features/home/presentation/home_screen.dart';
import 'package:flutter_starter/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:flutter_starter/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const _sentences = [
    'Every day is a chance to prove yourself.',
    'Small actions, day after day, build who you are.',
    'One sentence. One day. One step forward.',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < _sentences.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _complete();
    }
  }

  Future<void> _complete() async {
    await instanceGetIt<OnboardingLocalDatasource>().markComplete();
    if (mounted) context.go('/${HomeScreen.routeName}');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final cs = Theme.of(context).colorScheme;
    final isLast = _currentPage == _sentences.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 20),
              child: Text(
                'Prove.',
                style: AppTextStyles.labelLarge.copyWith(
                  color: cs.onSurfaceVariant,
                  letterSpacing: 2,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _sentences.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (_, index) => _OnboardingPage(sentence: _sentences[index]),
              ),
            ),
            _DotIndicator(
              count: _sentences.length,
              current: _currentPage,
            ),
            const SizedBox(height: AppDimensions.paddingL),
            AppButton(
              width: width / 2,
              label: isLast ? 'Begin' : 'Next',
              onPressed: _next,
              variant: AppButtonVariant.outlined,
            ),
            const SizedBox(height: AppDimensions.paddingXL),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.sentence});

  final String sentence;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingXL),
        child: Text(
          '"$sentence"',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge.copyWith(
            color: cs.onSurface,
            fontFamily: FontFamily.regular,
            fontStyle: FontStyle.italic,
            height: 1.35,
          ),
        ),
      ),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  const _DotIndicator({required this.count, required this.current});

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => _Dot(isActive: index == current),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 20 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: isActive ? cs.onSurface : cs.onSurfaceVariant,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
