import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWiddget extends StatelessWidget {
  final String label; LevelButtonWiddget({Key? key, required this.label}) : assert(
  ["Fácil", "Médio", "Difícil", "Perito"].contains(label)), super(key: key);

  final config = {
    "Fácil":{
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor" : AppColors.levelButtonTextFacil,
    },
    "Médio":{
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor" : AppColors.levelButtonTextMedio,
    },
    "Difícil":{
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor" : AppColors.levelButtonTextDificil,
    },
    "Perito":{
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor" : AppColors.levelButtonTextPerito,
    }
//lista do fácil, médio e dificl em um maps
  };

  Color get color => config[label]!['color']!;
  Color get borderCcolor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(
              BorderSide(
                color: borderCcolor,
              ),
            ),
            borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              color: fontColor,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

}
