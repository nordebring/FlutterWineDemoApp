import 'package:flutter/material.dart';
import '../../domain/models/wine.dart';

class WineWidget extends StatelessWidget {
  final Wine wine;
  final bool isRemovable;
  final void Function(Wine wine)? onRemove;
  final void Function(Wine wine)? onWinePressed;

  const WineWidget({
    Key? key,
    required this.wine,
    this.onWinePressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 10,
        child: Row(
          children: [
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${wine.wineName} ${wine.vintage}',
          style: const TextStyle(
            fontFamily: 'Butler',
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        Flexible(
          child: Row(
            children: [
              //const Icon(Icons.wine_bar, size: 15),
              Text(
                'Producer: ${wine.producerName.toString()}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onTap() {
    if (onWinePressed != null) {
      onWinePressed?.call(wine);
    }
  }
}
