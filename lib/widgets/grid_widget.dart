import 'package:flutter/material.dart';
import 'package:qtile/widgets/tile_widget.dart';

class GridWidget extends StatelessWidget {
  final List<List<Tile>> tiles;
  final int Function(int r, int c, Tile t) setTile;

  GridWidget({this.tiles, this.setTile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tiles.asMap().entries.map((r) => Row(
        children: r.value.asMap().entries.map((c) => Expanded(child: makeTile(r.key, c.key, c.value))).toList(),
      )).toList(),
    );
  }


  Widget makeTile(int r, int c, Tile t) {
    return InkWell(
      child: TileWidget(t),
      onTap: () {
        setTile(r, c, t.rotate());
      }
    );
  }

}
