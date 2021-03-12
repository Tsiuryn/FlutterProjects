
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed, this.onLongPressed});

  final IconData icon;
  final Function onPressed;
  final Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPressed,
      child: RawMaterialButton(
        elevation: 0.0,
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
