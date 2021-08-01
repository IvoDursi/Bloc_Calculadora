import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubResult( text: '1000' ),
        SubResult( text: 'X' ),
        SubResult( text: '1000' ),
        LineSeparator(),
        MainResultText( text: '2000' ),
      ],
    );
  }
}