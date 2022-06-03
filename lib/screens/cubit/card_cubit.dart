import 'package:card/screens/state/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState>{
  CardCubit():super(CardInitialState());

  static List imageList = [
    "first.png",
    "second.png",
    "third.png",
    "fourth.png",
    "fifth.png",
    "sixth.png",
  ];




}