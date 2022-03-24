import 'package:flutter/material.dart';

/// Custom business object class which contains properties to hold the detailed
/// information about the team which will be rendered in datagrid.
class Team {
  /// Creates the team class with required details.
  Team(
    this.team,
    this.winPercentage,
    this.gamesBehind,
    this.wins,
    this.losses,
    this.image,
  );

  /// Name of the team.
  final String team;

  /// Win percentage of the team.
  final double winPercentage;

  /// Games behind of the team.
  final double gamesBehind;

  /// Wins of the team.
  final int wins;

  /// Losses of the team.
  final int losses;

  /// Image of the team.
  final String image;
}
