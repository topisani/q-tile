import 'package:flutter/material.dart';
import 'dart:math' as math;

enum TileSide { open, closed, black, white }

class Tile {
  final List<TileSide> sides;

  Tile(TileSide top, TileSide right, TileSide bottom, TileSide left)
      : sides = [top, right, bottom, left];

  const Tile.fromList(this.sides);

  Tile rotate() => Tile.fromList(<TileSide>[sides[1], sides[2], sides[3], sides[0]]);
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  TileWidget(this.tile);
  @override
  Widget build(BuildContext context) {
    final drawn = CustomPaint(
        painter: TilePainter(tile), child: AspectRatio(aspectRatio: 1));
    return drawn;
  }
}

class TilePainter extends CustomPainter {
  static final lineCount = 13;
  static final color1 = Colors.lightBlue[100];
  static final color2 = Colors.blue[900];
  var _clipCounter = 0;

  final Tile tile;

  TilePainter(this.tile);

  @override
  void paint(Canvas canvas, Size size) {
    _clipCounter = 0;
    canvas.scale(size.width, size.height);
    _paintSide(canvas, tile.sides[0]);
    canvas.translate(1, 1);
    canvas.rotate(math.pi);
    _paintSide(canvas, tile.sides[2]);
    canvas.translate(0, 1);
    canvas.rotate(-math.pi / 2);
    _paintSide(canvas, tile.sides[1]);
    canvas.translate(1, 1);
    canvas.rotate(math.pi);
    _paintSide(canvas, tile.sides[3]);
  }

  void _paintSide(Canvas canvas, TileSide side) {
    switch (side) {
      case TileSide.open:
        _paintOpen(canvas);
        break;
      case TileSide.closed:
        _paintClosed(canvas);
        break;
      case TileSide.black:
        _paintBlack(canvas);
        break;
      case TileSide.white:
        _paintWhite(canvas);
        break;
    }
  }

  void _paintOpen(Canvas canvas) {
    canvas.save();
    var linesize = Size(1 / lineCount, 1);
    _clipTriangle(canvas);
    for (var i = 0; i < lineCount; i++) {
      canvas.drawRect(Offset(1 / lineCount * i, 0) & linesize,
          Paint()..color = (i % 2 == 0) ? color2 : color1);
    }
    canvas.restore();
  }

  void _paintClosed(Canvas canvas) {
    canvas.save();
    var linesize = Size(1, 1 / lineCount);
    _clipTriangle(canvas);
    for (var i = 0; i < lineCount; i++) {
      canvas.drawRect(Offset(0, 1 / lineCount * i) & linesize,
          Paint()..color = (i % 2 == 0) ? color2 : color1);
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
    canvas.save();
    _clipTriangle(canvas);
    canvas.drawRect(Offset.zero & Size(1, 1), Paint()..color = color1);
    canvas.restore();
  }

  void _clipTriangle(Canvas canvas) {
    var clipPath = Path();
    if (_clipCounter >= 2) {
      clipPath.moveTo(0, 0);
      clipPath.lineTo(0.5, 0.5);
      clipPath.lineTo(1, 0);
      clipPath.close();
    } else {
      clipPath.moveTo(0, 0);
      clipPath.lineTo(0, 0.5);
      clipPath.lineTo(1, 0.5);
      clipPath.lineTo(1, 0);
      clipPath.close();
    }
    _clipCounter++;
    canvas.clipPath(clipPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
