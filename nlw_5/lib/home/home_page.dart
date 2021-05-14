import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/elevel_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/home_controller.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWiddget(label: "Fácil"
                      //pega o corresponde dentro do Level Button e carrega pela cor e nome
                      ),
                  LevelButtonWiddget(label: "Médio"
                      //pega o corresponde dentro do Level Button e carrega pela cor e nome
                      ),
                  LevelButtonWiddget(label: "Difícil"
                      //pega o corresponde dentro do Level Button e carrega pela cor e nome
                      ),
                  LevelButtonWiddget(label: "Perito"
                      //pega o corresponde dentro do Level Button e carrega pela cor e nome
                      ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionsAnswered / e.questions.length,
                            //vai dividir o tanto que respondeu pelo tamanho para gerar a porcentagem
                            //da barrinha na tela
                            completed:
                                "${e.questionsAnswered}/${e.questions.length}",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                          questions: e.questions,
                                          title: e.title)));
                            },
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
