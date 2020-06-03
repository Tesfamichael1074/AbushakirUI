library Abushakir_UI;
import 'package:Abushakir_UI/src/mainUI.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class AbushakirUi {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;


  static showDatePicker(context) => showDialog(context: context, builder: (context) => AbushakirUiDialog());
}
