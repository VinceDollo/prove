import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_starter/values/constants.dart';

extension FileExtension on File {
  Future<File> compressImageFile({
    VoidCallback? onCompressStart,
    VoidCallback? onCompressEnded,
  }) async {
    const maxUploadSizeBytes = AppConstants.uploadSizeLimitBytes;

    final fileToCompress = File(path);

    debugPrint('Before compress : ${fileToCompress.lengthSync()}');

    var uInt8List = fileToCompress.readAsBytesSync();

    if (uInt8List.length > maxUploadSizeBytes) {
      if (onCompressStart != null) onCompressStart();

      var loop = 1;
      /// TODO Check if this while is really needed
      // ignore: invariant_booleans
      while (uInt8List.length > maxUploadSizeBytes) {
        uInt8List = await FlutterImageCompress.compressWithList(
          uInt8List,
          quality: 100 - loop * 10,
        );
        debugPrint('During compress : ${uInt8List.lengthInBytes}');
        loop++;
        if (loop == 10) break;
      }

      if (onCompressEnded != null) onCompressEnded();

      return File(path).writeAsBytes(uInt8List);
    } else {
      debugPrint('Compress not needed.');
      return this;
    }
  }
}
