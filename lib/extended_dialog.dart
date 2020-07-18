library extendeddialog;

// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class PopupMenuDividerExtended extends PopupMenuEntry<Null> {
  const PopupMenuDividerExtended({
    Key key,
    this.height = 0,
    this.color,
    this.indent,
    this.endindent,this.thickness
  }) : super(key: key);
  @override
  final double height;
  final double thickness;
  final Color color;
  final double indent;
  final double endindent;


  @override
  bool represents(void value) => false;
  @override
  _PopupMenuDividerExtendedState createState() => _PopupMenuDividerExtendedState();
}
class _PopupMenuDividerExtendedState extends State<PopupMenuDividerExtended> {
  @override
  Widget build(BuildContext context) =>
      Divider(height: widget.height,
        thickness: widget.thickness,
        color:widget.color,
        indent: widget.indent,
        endIndent: widget.endindent,
      );
}

class PopupMenuItemExtended<T> extends PopupMenuEntry<T> {

  const PopupMenuItemExtended({
    Key key,
    this.value,
    this.enabled = true,
    this.height = 48,
    this.textStyle,
    this.mouseCursor,
    @required this.child,
  }) : assert(enabled != null),
        assert(height != null),
        super(key: key);
  final T value;
  final bool enabled;
  @override
  final double height;
  final TextStyle textStyle;
  final MouseCursor mouseCursor;
  final Widget child;

  @override
  bool represents(T value) => value == this.value;

  @override
  PopupMenuItemStateExtended<T, PopupMenuItemExtended<T>> createState() => PopupMenuItemStateExtended<T, PopupMenuItemExtended<T>>();
}
class PopupMenuItemStateExtended<T, W extends PopupMenuItemExtended<T>> extends State<W> {

  @protected
  Widget buildChild() => widget.child;
  @protected
  void handleTap() {
    Navigator.pop<T>(context, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    TextStyle style = widget.textStyle ?? popupMenuTheme.textStyle ?? theme.textTheme.subtitle1;

    if (!widget.enabled)
      style = style.copyWith(color: theme.disabledColor);

    Widget item = AnimatedDefaultTextStyle(
      style: style,
      duration: kThemeChangeDuration,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        //constraints: BoxConstraints(minHeight: widget.height),
        //padding: const EdgeInsets.symmetric(horizontal: _kMenuHorizontalPadding),
        child: buildChild(),
      ),
    );

    if (!widget.enabled) {
      final bool isDark = theme.brightness == Brightness.dark;
      item = IconTheme.merge(
        data: IconThemeData(opacity: isDark ? 0.5 : 0.38),
        child: item,
      );
    }
    final MouseCursor effectiveMouseCursor = MaterialStateProperty.resolveAs<MouseCursor>(
      widget.mouseCursor ?? MaterialStateMouseCursor.clickable,
      <MaterialState>{
        if (!widget.enabled) MaterialState.disabled,
      },
    );

    return InkWell(
      onTap: widget.enabled ? handleTap : null,
      canRequestFocus: widget.enabled,
      mouseCursor: effectiveMouseCursor,
      child: item,
    );
  }
}

