import 'package:flutter/services.dart';

List<TextInputFormatter> numberFormat(){
  List<TextInputFormatter> formatter = List<TextInputFormatter>();
  // Pattern pattern = "[/qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]";
  Pattern pattern = r'^([0-9]+)';
  formatter.add(
    WhitelistingTextInputFormatter(
      RegExp(
        pattern,
      )
    ),
  );
  return formatter;
}
