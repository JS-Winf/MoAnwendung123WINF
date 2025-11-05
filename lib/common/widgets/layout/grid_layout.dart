import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

/// Wiederverwendbares 2-Spalten-Grid-Layout.
/// - Nutzt `GridView.builder` für performantes Lazy-Building.
/// - Fixe Spaltenanzahl (2), konfigurierbare Item-Höhe (`mainAxisExtent`).
class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,                 // Anzahl der Grid-Items
    required this.itemBuilder,               // Builder-Funktion für einzelne Zellen
    this.mainAxisExtent = 288,               // Höhe jeder Grid-Zelle
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,                                  // Passt sich dem Inhalt an (kein expand)
      padding: EdgeInsets.zero,                          // Kein Außen-Padding
      physics: const NeverScrollableScrollPhysics(),     // Scrollen vom umgebenden Parent steuern lassen
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,                               // 2 Spalten
        mainAxisExtent: mainAxisExtent,                  // Fixe Höhe der Items
        mainAxisSpacing: TSizes.gridViewSpacing,         // Vertikaler Abstand
        crossAxisSpacing: TSizes.gridViewSpacing,        // Horizontaler Abstand
      ),
      itemBuilder: itemBuilder,                           // Baut jedes Grid-Item
    );
  }
}
