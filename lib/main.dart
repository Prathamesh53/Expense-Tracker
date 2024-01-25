//in theme data use .copywith
//color scheme:we give one pereticular color then flutter automatically gives its shades to different widgets
//safearea=>to keep our page safe from camera and speaker.etc
//MediaQuery.of(context)=>gives information about page(total height,weidth.etc)
//to make app responsive make every page different for normal and landscape mode
// if(Platform.isIOS)=>another code for ios and else another code for android
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paise_bachao_yojna/Widgets/expenses.dart';

var kcolorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(31, 212, 66, 231));

var kdarkcolorscheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(31, 212, 66, 231),
  brightness: Brightness.dark,
);
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kdarkcolorscheme,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kdarkcolorscheme.onPrimaryContainer,
          foregroundColor: kdarkcolorscheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
          color: kdarkcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kcolorscheme.primaryContainer)),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kcolorscheme,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
          color: kcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kcolorscheme.primaryContainer)),
    ),
    home: Expenses(),
  ));
}
