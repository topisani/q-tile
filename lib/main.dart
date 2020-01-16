import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:qtile/widgets/tile_widget.dart';
import 'package:qtile/widgets/grid_widget.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}

var tiles = [
  Tile(TileSide.open, TileSide.closed, TileSide.black, TileSide.white),
  Tile(TileSide.open, TileSide.closed, TileSide.black, TileSide.white),
  Tile(TileSide.open, TileSide.closed, TileSide.black, TileSide.white),
  Tile(TileSide.open, TileSide.closed, TileSide.black, TileSide.white),
];

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
            child: GridWidget([
              [tiles[0], tiles[1], tiles[2]],
              [tiles[0], tiles[1], tiles[2]],
              [tiles[0], tiles[1], tiles[2]],
            ]),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
