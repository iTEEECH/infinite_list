import 'package:infinite_list/src/feature/characters/data/model/character_model.dart';
import 'package:infinite_list/src/feature/characters/data/remote/character_remote.dart';
import 'package:infinite_list/src/feature/characters/domain/entity/character.dart';
import 'package:infinite_list/src/feature/characters/domain/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<Character>> fetchAllCharacters(int page) async {
    try {
      // Remote call.
      final CharacterRemote remote = CharacterRemote();
      final List<CharacterModel> characters = await remote.fetchAllCharacters(page);

      // Result.
      return characters.map((character) => character.toEntity()).toList();
    } catch (err) {
      throw Exception(err);
    }
  }
}