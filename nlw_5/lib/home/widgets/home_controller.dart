import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import '../home_state.dart';

class HomeController {
 final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
 set state(HomeState state) => stateNotifier.value= state;
 HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async{
    state= HomeState.loading;
    await userModel();
    state = HomeState.sucess;
  }

  Future<UserModel> userModel() async => user = await repository.getUser();

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucess;
  }
}
