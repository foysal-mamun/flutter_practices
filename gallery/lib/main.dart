import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gallery/constants.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {

  const GalleryApp({
    Key key,
    this.initialRoute,
    this.isTestMode = false
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;
  
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Gallery',
            debugShowCheckedModeBanner: false,
            themeMode: GalleryOptions.of(context).themeMode,
          );
        }
      ),
    );
  }
}