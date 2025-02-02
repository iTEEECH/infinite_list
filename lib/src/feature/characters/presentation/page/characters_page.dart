import 'package:flutter/material.dart';
import 'package:infinite_list/src/feature/characters/data/repository/character_repositroy_impl.dart';
import 'package:infinite_list/src/feature/characters/domain/entity/character.dart';
import 'package:infinite_list/src/feature/characters/presentation/widget/character_list.dart';
import 'package:infinite_list/src/feature/characters/presentation/widget/character_loading.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  List<Character> characters = [];
  bool isLoading = true;
  bool hasMore = true;
  int page = 1;

  Future<void> fetchCharacters() async {
    if (!hasMore) return;

    // TODO: Use Riverpod or GetIt to implement the dependency injection principle.
    final repository = CharacterRepositoryImpl();
    final List<Character> result = await repository.fetchAllCharacters(page);

    if(context.mounted) {
      setState(() {
        characters.addAll(result);
        isLoading = false;
        hasMore = result.length == 10;
        page++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Characters'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent) {
                fetchCharacters();
              }
              return false;
            },
            child: isLoading
                ? const CharacterLoading()
                : CharactersList(characters: characters),
          ),
        ),
      ),
    );
  }
}
