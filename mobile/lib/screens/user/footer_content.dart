import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/user/sp_text_button/sp_text_button.dart';

class FooterContent extends StatelessWidget {
  const FooterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SPTextButton(
          text: "FAQs",
        ),
        const SPTextButton(
          text: "ABOUT US",
        ),
        const SPTextButton(
          text: "TERMS OF USE",
        ),
        const SPTextButton(
          text: "PRIVACY POLICY",
        ),
      ],
    );
  }
}
