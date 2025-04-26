import 'dart:io';

void main() {
  String word = "hangman";
  // الكلمه الي انا مختار اللعبه عنها
  List<String> guessedLetters = [];
  // هنا كل الحروف الي انا خمنتها
  int maxAttempts = 6;
  // عدد المحاولات المسموحه لي
  int wrongAttempts = 0;
  // عدد المحاولات الخاطئه

  // هنا بقول طول ما محاولاتي مخلصتش اكمل لعب
  while (wrongAttempts < maxAttempts) {
    String displayWord = "";
    // هنا بكتب المتغير الي هيظهر لي فيه الحروف الي انا خمنتها
    bool allGuessed = true;
    // هنا بقول لو كل الحروف الي في الكلمه اتخمنوا صح يبقي العب انتهت

    for (int i = 0; i < word.length; i++) {
      if (guessedLetters.contains(word[i])) {
        displayWord += word[i] + " ";
        // هنا بقول لو الحرف الي في الكلمه موجود في الحروف الي انا خمنتها يبقي اكتب الحرف
      } else {
        displayWord += "_ ";
        // هنا بقول لو الحرف الي في الكلمه مش موجود في الحروف الي انا خمنتها يبقي اكتب _
        allGuessed = false;
        // هنا بقول لو الحرف الي في الكلمه مش موجود في الحروف الي انا خمنتها يبقي اللعب لسه مكمل
      }
    }

    print("The word is : $displayWord");
    print(" The remaining attempts : ${maxAttempts - wrongAttempts}");

    if (allGuessed) {
      print(" Gongratulations You guessed the word: $word");
      return;
    }

    stdout.write(" Enter a letter: ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      // هنا بقول لو المدخلات فاضيه يبقي اكتب يدخل الحرف
      print(" Please enter a letter.");
      continue;
    }
    // هنا بقول لو الحروف كابتل يحولها لسمول
    String letter = input.toLowerCase();

    // هنا بقول لو الحرف المدخل مش حرف واحد يبقي اكتب يدخل حرف واحد بس
    if (letter.length != 1) {
      print(" Please enter a single letter ");
      continue;
    }

    // هنا بقوله لو دخل حرف دخله قبل كده انه دخل الحرف ده قبل كده
    if (guessedLetters.contains(letter)) {
      print(" You already guessed that letter ");
      continue;
    }

    // هنا بدخل الحرف الي دخله لمجموعه الحروف الي خمنها
    guessedLetters.add(letter);

    if (word.contains(letter)) {
      print(" the letter is in the word!");
    } else {
      wrongAttempts++;
      print(" the letter is not in the word!");
    }
  }

  print(" sorry you lost! The word was: $word");
}
