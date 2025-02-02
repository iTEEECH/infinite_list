import 'package:equatable/equatable.dart';
import 'package:infinite_list/src/feature/characters/domain/entity/character.dart';

class CharacterModel extends Equatable {
  final String name;
  final String imageUrl;
  final List<String> films;

  const CharacterModel({
    required this.name,
    required this.imageUrl,
    required this.films,
  });

  @override
  List<Object> get props {
    return [
      name,
      imageUrl,
      films,
    ];
  }

  Character toEntity() {
    return Character(
      name: name,
      imageUrl: imageUrl,
      films: films,
    );
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      films: List<String>.from(map['films'] ?? []),
    );
  }
}
