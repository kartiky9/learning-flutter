// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final color;

  final name;

  final iconLocation;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  const Category(
      {@required this.name, @required this.color, @required this.iconLocation});

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: this.color,
        highlightColor: this.color,
        // focusColor: this.color,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        onTap: () {
          print('');
        },
        child: Container(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  iconLocation,
                  size: 60.0,
                ),
              ),
              Text(
                this.name,
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
