library layereddropdowncard;

import 'package:flutter/material.dart';
import 'package:layereddropdowncard/dropdowncard.dart';

class LayeredDropdown extends StatefulWidget {
  final Key key;

  final Widget hiddenChild;
  final Widget cardChild;

  //Animation Variables
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;

  final double minSpace;
  final double maxSpace;

  final Function openerIconClicked;

  LayeredDropdown({
    this.openerIconClicked,
    this.key,
    this.hiddenChild,
    this.animationDuration,
    this.curve,
    this.reverseCurve,
    this.minSpace = 45.0,
    this.maxSpace = 300.0,
    this.cardChild,
  }) : super(key: key);

  @override
  _LayeredDropdownState createState() => _LayeredDropdownState();
}

class _LayeredDropdownState extends State<LayeredDropdown>
    with TickerProviderStateMixin {
  //Private Variables
  AnimationController _animationController;
  Animation _animation;
  bool _open;

  double _minSpace;
  double _maxSpace;
  double _currentSpace;

  @override
  void initState() {
    super.initState();
    _setupAnimationValues();
    _setupAnimationListeners();
  }

  void _setupAnimationValues() {
    _minSpace = widget.minSpace;
    _maxSpace = widget.maxSpace;
    _currentSpace = widget.minSpace;
    _open = false;

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.curve ?? Curves.easeOutExpo,
      reverseCurve: widget.reverseCurve ?? Curves.easeOutExpo,
    );
  }

  void _setupAnimationListeners() {
    _animationController.addListener(() {
      print(_animation.value);
      setState(() {
        print(_currentSpace);
        _currentSpace = _maxSpace * _animation.value + _minSpace;
      });
    });
  }

  void _moveCard() {
    print('moveCardPressed');
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
      _open = false;
    } else {
      _animationController.forward();
      _open = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: widget.hiddenChild ??
              Container(
                height: _currentSpace,
                color: Colors.transparent,
              ),
          onTap: _moveCard,
        ),
        DropDownCard(
          topSpacing: _currentSpace,
          child: widget.cardChild ?? Container(),
          onOpenerIconClicked: widget.openerIconClicked == null
              ? () {}
              : widget.openerIconClicked,
        )
      ],
    );
  }
}
