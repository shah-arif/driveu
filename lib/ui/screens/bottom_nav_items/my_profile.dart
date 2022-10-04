import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MidText(text: "My Profile", size: 40)
    );
  }
}
