import 'package:flutter/material.dart';

import '../../widgets/mid_text.dart';

class MyDriver extends StatelessWidget {
  const MyDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MidText(text: "My Driver", size: 40)
      ),
    );
  }
}
