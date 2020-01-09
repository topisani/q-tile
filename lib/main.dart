import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

// import 'package:lyric_notes/layouts/home_desktop.dart';
import 'package:lyric_notes/layouts/home_mobile.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter test app',
      theme: ThemeData.light(),
      home: OrientationBuilder(
        builder: (context, orientation) => buildHome(context),
      ),
    );
  }

  Widget buildHome(BuildContext context) {
    // var isLargeScreen = MediaQuery.of(context).size.width > 920;
    // return isLargeScreen ? HomeLayoutDesktop() : HomeLayoutMobile();
    return HomeLayoutMobile();
  }
}
