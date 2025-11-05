import 'package:flutter/material.dart';

import 'curved_edges.dart';

/// Wrapper-Widget, das seinen Inhalt entlang einer benutzerdefinierten
/// Kurvenform (ClipPath) beschneidet.
class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  /// Das zu beschneidende Kind-Widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // Verwendet den benutzerdefinierten Clipper, der die Kurvenform definiert.
      clipper: TCustomCurvedEdges(),
      child: child, // Inhalt wird entlang der Kurve "geclippt".
    );
  }
}
