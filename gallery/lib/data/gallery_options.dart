import 'package:flutter/material.dart';

enum CustomTextDirection {
  localBased,
  ltr,
  rtl
}

class GalleryOptions {
  const GalleryOptions({
    this.themeMode,
    double textScaleFactor,
    this.customTextDirection,
    Locale locale,
    this.timeDilation,
    this.platform,
    this.isTestMode
  }) : _textScaleFactor = textScaleFactor,
       _locale = locale;

  final ThemeMode themeMode;
  final double _textScaleFactor;
  final CustomTextDirection customTextDirection;
  final Locale _locale;
  final double timeDilation;
  final TargetPlatform platform;
  final bool isTestMode;

  static GalleryOptions of(BuildContext context) {
    final scope = 
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
        return scope.modelBindingState.currentModel;
  }
}

class _ModelBindingScope extends InheritedWidget {
  
  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    Widget child
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  
  ModelBinding({ 
    Key key, 
    this.initialModel = const GalleryOptions(),
    this.child
  }) : assert(initialModel != null),
       super(key: key);

  final GalleryOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {

  GalleryOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}