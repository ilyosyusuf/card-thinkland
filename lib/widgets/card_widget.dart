import 'dart:io' as io;
import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blur/blur.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: ((context, candidateData, rejectedData) {
        return Container(
          width: context.w * 0.9,
          height: context.h * 0.25,
          decoration:
              context.watch<CardCubit>().colorConst == Colors.transparent
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: context.watch<CardCubit>().image != null
                              ? FileImage(io.File(
                                      context.watch<CardCubit>().image!.path))
                                  as ImageProvider
                              : AssetImage("${CardCubit.randImg}")),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: context.watch<CardCubit>().colorConst,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
          child: Stack(
            children: [
              Blur(
                colorOpacity: 0.0,
                blur: context.watch<CardCubit>().blur,
                child: Container(
                  width: context.w * 0.9,
                  height: context.h * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1234 5678 9101 1213",
                        style: TextStyle(
                            color: context.watch<CardCubit>().colorConst ==
                                    Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontSize: 22.0),
                      ),
                      Text(
                        "MM/YY",
                        style: TextStyle(
                            color: context.watch<CardCubit>().colorConst ==
                                    Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontSize: 16.0),
                      ),
                      Text(
                        "Card Holder Name",
                        style: TextStyle(
                            color: context.watch<CardCubit>().colorConst ==
                                    Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        context.read<CardCubit>().changeImage(data: data);
        debugPrint(data.toString());
      },
    );
  }
}
