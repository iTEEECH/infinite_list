import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String imageUrl;
  final List<String> films;

  const Character({
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
}
