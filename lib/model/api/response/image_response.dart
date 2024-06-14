import 'package:flutter_starter/model/api/response/hydra_member.dart';

class ImageResponse extends Hydra {
  ImageResponse({
    this.path,
  });

  ImageResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    path = json['path'] as String?;
  }

  String? path;

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['path'] = path;
    return data;
  }

  ImageResponse copyWith({
    String? path,
  }) {
    return ImageResponse(
      path: type ?? this.path,
    );
  }
}

extension ImageResponseList on List {
  List<ImageResponse> getImageResponseList() {
    final result = <ImageResponse>[];

    for (final jsonImage in this) {
      if (jsonImage is Map<String, dynamic>) {
        result.add(ImageResponse.fromJson(jsonImage));
      }
    }

    return result;
  }
}
