import 'package:flutter/cupertino.dart';

double width(BuildContext context)=> MediaQuery.of(context).size.width;
double height(BuildContext context)=> MediaQuery.of(context).size.height;

double widthRatio(double w,BuildContext context)=> w*width(context)/402;
double heightRatio(double h,BuildContext context)=> h*height(context)/874;

Color mainColor = Color(0xff29384D);
Color secColor = Color(0xffFFF1D4);