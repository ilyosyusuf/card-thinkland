import 'dart:math';
import 'dart:io' as io;
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 350,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("XXXX XXXX XXXX XXXX", style: TextStyle(color: Colors.white, fontSize: 22.0)),
            Text("MM/YY", style: TextStyle(color: Colors.white, fontSize: 16.0)),
            Text("Card Holder Name", style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: context.watch<CardCubit>().image != null ?
            FileImage(io.File(context.watch<CardCubit>().image!.path)) as ImageProvider:
            AssetImage("assets/cardimages/${CardCubit.imageList[Random().nextInt(6)]}")
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
