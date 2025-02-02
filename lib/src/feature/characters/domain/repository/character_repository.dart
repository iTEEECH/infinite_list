import 'package:infinite_list/src/feature/characters/domain/entity/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchAllCharacters(int page);
}