import 'dart:io' as io;
import 'package:card/core/extensions/context_extension.dart';
import 'package:card/screens/cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blur/blur.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: ((context, candidateData, rejectedData) {
        return Container(
          // padding: EdgeInsets.all(20.0),
          width: context.w * 0.9,
          height: context.h * 0.25,
          child: Stack(
            children: [
              Blur(
                colorOpacity: 0.0,
                blur: context.watch<CardCubit>().blur,
                child: Container(
                  // padding: EdgeInsets.all(20.0),
                  width: context.w * 0.9,
                  height: context.h * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                ),
              ),
              Positioned(
                child: Container(
          padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("XXXX XXXX XXXX XXXX",
                          style: TextStyle(
                              color: context.watch<CardCubit>().colorConst ==
                                      Colors.white
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 22.0)),
                      Text("MM/YY",
                          style: TextStyle(
                              color: context.watch<CardCubit>().colorConst ==
                                      Colors.white
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16.0)),
                      Text(
                        "Card Holder Name",
                        style: TextStyle(
                            color: context.watch<CardCubit>().colorConst ==
                                    Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontSize: 20.0),
                      ),

                      // BackdropFilter(
                      //   filter: ImageFilter.blur(sigmaX: context.watch<CardCubit>().blur, sigmaY: context.watch<CardCubit>().blur),
                      //   child: Container(
                      //     color: Colors.black,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration:
              context.watch<CardCubit>().colorConst == Colors.transparent
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          //  colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear):
                          image: context.watch<CardCubit>().image != null
                              ? FileImage(io.File(
                                      context.watch<CardCubit>().image!.path))
                                  as ImageProvider
                              : AssetImage("${CardCubit.randImg}")
                          //       .blurred(
                          //   blur: context.watch<MyCreditCardCubit>().blurValue,
                          //   blurColor: Colors.transparent,
                          //   colorOpacity: 0.0,
                          // ),
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
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
                          offset: Offset(0, 3), // changes position of shadow
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
        // setState((){});
      },
    );
  }
}
