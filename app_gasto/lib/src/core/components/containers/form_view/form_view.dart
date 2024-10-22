import 'package:flutter/material.dart';

class FormView extends StatelessWidget {
  final Widget child;


  const FormView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
        return Container(
          alignment: Alignment.topCenter,
            width: constraints.maxWidth > 900 ? 900 : constraints.maxWidth,
            child:  child);
      }),
    );
  }
}
