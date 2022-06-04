import 'dart:math';

import 'package:card/screens/state/card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardCompleteState());

  Color colorConst = Colors.transparent;
  double blur = 0.0;



  static List imageList = [
    "first.png",
    "second.png",
    "third.png",
    "fourth.png",
    "fifth.png",
    "sixth.png",
  ];

  final imagePicker = ImagePicker();
  XFile? image;
  void fromGallery() async {
    colorConst = Colors.transparent;
    image = (await imagePicker.pickImage(source: ImageSource.gallery))!;

    emit(CardCompleteState());
  }

  static String randImg = "assets/cardimages/${imageList[Random().nextInt(6)]}";

  void changeImage({required String data}) {
    colorConst = Colors.transparent;
    image = null;
    randImg = data;
    emit(CardCompleteState());
  }

  void changeColor({required Color color}) {
    colorConst = color;
    emit(CardCompleteState());
  }

  void changeBLur({required data}) {
    blur = data;
    emit(CardCompleteState());
  }
}
