import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/animation.dart' as animation;
import 'package:flame/flame.dart';
import 'package:flame/position.dart';

class SpritePosition extends StatefulWidget {
  @override
  _SpritePositionState createState() => _SpritePositionState();
}

class _SpritePositionState extends State<SpritePosition> {
  EPosition _position;

  @override
  void initState() {
    _position = EPosition.Front;
    super.initState();
  }

  void changePosition(EPosition position) {
    setState(() {
      _position = position;
    });
  }

  double getPositionX(EPosition position) {
    switch (position) {
      case EPosition.Front:
        return 0.0;

      case EPosition.Back:
        return 2.0;

      case EPosition.Left:
        return 3.0;

      case EPosition.Right:
        return 4.0;

      default:
        return 2.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_position);
    print(getPositionX(_position));
    Random rand = new Random();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ArrowIcon(
          iconData: Icons.arrow_upward,
          onPressed: () {
            changePosition(EPosition.Back);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ArrowIcon(
              iconData: Icons.arrow_back,
              onPressed: () {
                changePosition(EPosition.Left);
              },
            ),
            Flame.util.animationAsWidget(
              Position(48.0, 48.0),
              animation.Animation.sequenced('poke.png', 2,
                  textureX: 24 * getPositionX(_position),
                  textureHeight: 24,
                  textureWidth: 24),
            ),
            ArrowIcon(
              iconData: Icons.arrow_forward,
              onPressed: () {
                changePosition(EPosition.Right);
              },
            ),
          ],
        ),
        ArrowIcon(
          iconData: Icons.arrow_downward,
          onPressed: () {
            changePosition(EPosition.Front);
          },
        ),
      ],
    );
  }
}

class ArrowIcon extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;

  ArrowIcon({@required this.iconData, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        size: 20.0,
      ),
      onPressed: onPressed,
    );
  }
}

enum EPosition {
  Front,
  Back,
  Left,
  Right,
}
