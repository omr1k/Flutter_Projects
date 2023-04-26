import 'package:valorant_arena_app/data/model/ability_model.dart';
import 'package:valorant_arena_app/data/model/voice_line.dart';

class Charactor {
  String description, displayName, fullPortrait, displayIcon;
  List<Ability> abilities;
  VoiceLine voice_line;
  Charactor({
    required this.description,
    required this.displayName,
    required this.fullPortrait,
    required this.displayIcon,
    required this.abilities,
    required this.voice_line,
  });
}
