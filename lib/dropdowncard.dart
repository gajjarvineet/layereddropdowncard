import 'package:flutter/material.dart';

const kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    topLeft: Radius.circular(20.0),
  ),
);

class DropDownCard extends StatefulWidget {
  DropDownCard({
    @required this.topSpacing,
    @required this.onOpenerIconClicked,
    this.child,
    this.openerIcon = Icons.dehaze,
    this.openerIconColor = Colors.grey,
    this.openerIconSplashColor,
    this.openerIconHighlightColor,
    this.shape = kCardShape,
  });

  final double topSpacing;
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
      elevation: 40.0,
      clipBehavior: Clip.hardEdge,
      shape: widget.shape,
      margin: EdgeInsets.only(top: widget.topSpacing),
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
