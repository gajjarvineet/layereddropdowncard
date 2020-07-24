import 'package:flutter/material.dart';

const kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    topLeft: Radius.circular(20.0),
  ),
);

const Color kOpenerIconDefaultSplashColour = Colors.transparent;
const Color kOpenerIconDefaultHighlightColour = Colors.transparent;

class DropDownCard extends StatefulWidget {
  DropDownCard({
    @required this.onOpenerIconClicked,
    this.child,
    this.openerIcon = Icons.dehaze,
    this.openerIconColor = Colors.grey,
    this.openerIconSplashColor = kOpenerIconDefaultSplashColour,
    this.openerIconHighlightColor = kOpenerIconDefaultHighlightColour,
    this.shape = kCardShape,
  });

  final Function onOpenerIconClicked;
  final IconData openerIcon;
  final Color openerIconColor;
  final Color openerIconSplashColor;
  final Color openerIconHighlightColor;
  final Widget child;
  final ShapeBorder shape;

  @override
  _DropDownCardState createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      elevation: 40.0,
      clipBehavior: Clip.hardEdge,
      shape: widget.shape,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            splashColor: widget.openerIconSplashColor,
            highlightColor: widget.openerIconHighlightColor,
            onTap: widget.onOpenerIconClicked,
            child: Icon(
              widget.openerIcon,
              color: widget.openerIconColor,
            ),
          ),
          Expanded(
            child: widget.child ?? Container(),
          ),
        ],
      ),
    );
  }
}
