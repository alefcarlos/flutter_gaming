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
    _position = EPosition.Back;
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
        return 1.0;

      case EPosition.Left:
        return 2.0;

      case EPosition.Right:
        return 3.0;

      default:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_position);
    print(getPositionX(_position));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_upward,
            size: 20.0,
          ),
          onPressed: () {
            changePosition(EPosition.Back);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 20.0,
              ),
              onPressed: () {
                changePosition(EPosition.Left);
              },
            ),
            Flame.util.animationAsWidget(
                Position(48.0, 48.0),
                animation.Animation.sequenced('poke.png', 2,
                    textureX: 24 * getPositionX(_position),
                    textureHeight: 24,
                    textureWidth: 24)
                  ..loop = false),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 20.0,
              ),
              onPressed: () {
                changePosition(EPosition.Right);
              },
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_downward,
            size: 20.0,
          ),
          onPressed: () {
            changePosition(EPosition.Front);
          },
        ),
      ],
    );
  }
}

enum EPosition {
  Front,
  Back,
  Left,
  Right,
}
