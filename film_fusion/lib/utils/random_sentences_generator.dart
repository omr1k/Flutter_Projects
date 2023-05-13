import 'dart:math';

final _sentences = [
  'The sun sets on Paris',
  'A dog barks in delight',
  'Red roses bloom in May',
  'Life is a box of chocolates',
  'The waves crash against rocks',
  'I love pizza with mushrooms',
  'Raindrops fall on my face',
  'The stars twinkle in the sky',
  'Winter snow covers the ground',
  'A baby giggles with joy',
  'The wind whispers through trees',
  'The moon rises over mountains',
  'My heart sings with happiness',
  'Butterflies dance in the breeze',
  'The river flows peacefully by',
  'I dream of traveling the world',
  'Autumn leaves crunch underfoot',
  'The ocean sparkles in the sun',
  'I run through fields of flowers',
  'The fire crackles in the hearth',
];

String getRandomSentence() {
  final random = Random();
  final index = random.nextInt(_sentences.length);
  return _sentences[index];
}
