import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:qtile/widgets/tile_widget.dart';
import 'package:qtile/widgets/grid_widget.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  //debugDefaultTargetPlatformOverride = TargetPlatform.linux;

  runApp(new MyApp());
}

var allTiles = [
  Tile(TileSide.open, TileSide.closed, TileSide.black, TileSide.closed),
  Tile(TileSide.open, TileSide.open, TileSide.closed, TileSide.white),
  Tile(TileSide.closed, TileSide.white, TileSide.white, TileSide.white),
  Tile(TileSide.black, TileSide.closed, TileSide.black, TileSide.open),
];

class GameGrid extends StatefulWidget {
  _GameGridState createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  var tiles = [
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
    [allTiles[0], allTiles[1], allTiles[2], allTiles[0], allTiles[1], allTiles[2]],
  ];

  @override
  Widget build(BuildContext context) {
            return GridWidget(
              tiles: this.tiles,
              setTile: (int r, int c, Tile t) {
                setState(() {
                   this.tiles[r][c] = t;
                });
              }
            );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to q-tile',
      home: Scaffold(body: Center(child: GameGrid())),
      debugShowCheckedModeBanner: false,
    );
  }
}
