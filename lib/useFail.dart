// ignore_for_file: file_names

import 'package:tapshyrma7_quize_app/model.dart';

class UseQuize {
  int index = 0;
  List<QuizeModel> surooJoop = [
    QuizeModel(suroo: 'Куран Рамазан айында тушконбу?', joop: true),
    QuizeModel(suroo: 'Куран 22 жылда толук тушурулгонбу?', joop: false),
    QuizeModel(suroo: 'Эн узун суро Бакара суросубу?', joop: true),
    QuizeModel(suroo: 'Куранды жатка билгендер Хафиз болушабы?', joop: true),
    QuizeModel(suroo: '5 убакыт намаз парзбы?', joop: true),
    QuizeModel(suroo: 'Гусул алууда 5 парз барбы?', joop: false),
    QuizeModel(suroo: 'Витр намазы парз намазбы?', joop: false),
    QuizeModel(
        suroo: 'Aли р.a. Пайгамбарыбыздын с.а.в куйоо баласы болгобу?',
        joop: true),
    QuizeModel(suroo: 'Барзах ааламы барбы?', joop: true),
  ];
  String surooAluu() {
    return surooJoop[index].suroo;
  }

  bool joopAluu() {
    return surooJoop[index].joop;
  }

  void nextQuestion() {
    if (index <= surooJoop.length) {
      index++;
    }
  }

  bool isFinished() {
    if (surooJoop[index] == surooJoop.last) {
      return true;
    } else {
      return false;
    }
  }

  void indexZero() {
    index = 0;
  }
}
