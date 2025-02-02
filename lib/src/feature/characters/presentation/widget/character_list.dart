import 'package:flutter/material.dart';
import 'package:infinite_list/src/feature/characters/domain/entity/character.dart';
import 'package:infinite_list/src/feature/characters/presentation/widget/character_card.dart';

class CharactersList extends StatefulWidget {
  final List<Character> characters;

  const CharactersList({
    super.key,
    required this.characters,
  });

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Character> characters = widget.characters;

    return ListView.builder(
      controller: _controller,
      itemCount: widget.characters.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, int index) {
        final character = characters[index];
        return CharacterCard(
          key: ValueKey(index),
          name: character.name,
          imageUrl: character.imageUrl,
          films: character.films,
        );
      },
    );
  }
}
