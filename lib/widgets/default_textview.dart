import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextView(
        {required String text,
        Color? color,
        double? fontsize,
        double? heigth,
        TextAlign? textAlign,
        double? letterpacing,
        TextOverflow? overflow,
        int? maxlines,
        TextDecoration? decoration,
        FontWeight? fontWeight}) =>
    Text(
      text,
      maxLines: maxlines ?? null,
      overflow: overflow ?? null,
      textAlign: textAlign ?? TextAlign.justify,
      style: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          letterSpacing: letterpacing ?? null,
          color: color ?? Colors.white,
          fontSize: fontsize ?? 14,
          height: heigth ?? 1,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
