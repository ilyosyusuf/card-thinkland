import 'package:card/screens/state/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CardCubit extends Cubit<CardState>{
  CardCubit():super(CardCompleteState());

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
    image = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    emit(CardCompleteState());
  }

}