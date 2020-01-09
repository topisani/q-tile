import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to q-tile',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to q-tile'),
          ),
          body: Center(
            child: TileWidget(),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
        painter: TilePainter(),
        child: SizedBox(
          width: 100,
          height: 100,
        ));
  }
}

class TilePainter extends CustomPainter {
  static final color1 = Colors.lightBlue[100];
  static final color2 = Colors.blue[900];
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width, size.height);
    var rect = Offset.zero & Size(1, 1);
    canvas.drawRect(rect, Paint()..color = color1);
    _paintOpen(canvas);
    canvas.translate(1, 0);
    canvas.rotate(math.pi / 2);
    _paintWhite(canvas);
    canvas.translate(1, 0);
    canvas.rotate(math.pi / 2);
    _paintClosed(canvas);
    canvas.translate(1, 0);
    canvas.rotate(math.pi / 2);
    _paintBlack(canvas);

    // TODO: implement paint
  }

  void _paintOpen(Canvas canvas) {
    canvas.save();
    var linesize = Size(1 / 17, 1);
    _clipTriangle(canvas);
    for (var i = 0; i < 9; i++) {
      canvas.drawRect(
          Offset(1 / 17 * i * 2, 0) & linesize, Paint()..color = color2);
    }
    canvas.restore();
  }

  void _paintClosed(Canvas canvas) {
    canvas.save();
    var linesize = Size(1, 1 / 17);
    _clipTriangle(canvas);
    for (var i = 0; i < 9; i++) {
      canvas.drawRect(
          Offset(0, 1 / 17 * i * 2) & linesize, Paint()..color = color2);
    }
    canvas.restore();
  }

  void _paintBlack(Canvas canvas) {
    canvas.save();
    _clipTriangle(canvas);
    canvas.drawRect(Offset.zero & Size(1, 1), Paint()..color = color2);
    canvas.restore(); 
  }

  void _paintWhite(Canvas canvas) {

  }

  void _clipTriangle(Canvas canvas) {
    var clipPath = Path();
    clipPath.moveTo(0, 0);
    clipPath.lineTo(0.5, 0.5);
    clipPath.lineTo(1, 0);
    clipPath.close();
    canvas.clipPath(clipPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
