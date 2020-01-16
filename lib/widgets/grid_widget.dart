import 'package:flutter/material.dart';
import 'package:qtile/widgets/tile_widget.dart';

class GridWidget extends StatelessWidget {
  final List<List<Tile>> tiles;

  GridWidget(this.tiles);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tiles.map((r) => Row(
        children: r.map((t) => Expanded(child: TileWidget(t))).toList(),
        )).toList(),
    );
  }

}
