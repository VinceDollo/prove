import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/core/assets/assetsGen/assets.gen.dart';
import 'package:flutter_starter/features/home/domain/entities/sentence_entity.dart';
import 'package:flutter_starter/features/home/presentation/providers/like_notifier.dart';

class LikeButtonWidget extends ConsumerStatefulWidget {
  const LikeButtonWidget({
    required this.sentence,
    super.key,
  });

  final SentenceEntity sentence;

  @override
  ConsumerState<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends ConsumerState<LikeButtonWidget> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.sentence.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(likeProvider, (previous, next) async {
      if (next is LikeStateError) {
        setState(() {
          isLiked = !isLiked;
        });
      }
    });

    return GestureDetector(
      onTap: () async {
        setState(() {
          isLiked = !isLiked;
        });
        await ref.read(likeProvider.notifier).toggleLike();
      },
      child: isLiked
          ? Assets.lib.core.assets.images.heartSolid
              .svg(colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn), height: 40)
          : Assets.lib.core.assets.images.heartOutline.svg(height: 40),
    );
  }
}
