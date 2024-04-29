import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'text_style.dart';


final ButtonStyle yellowPrimary = ElevatedButton.styleFrom(
minimumSize: const Size(172, 48),
  backgroundColor: mainYellow,
  elevation: 1,
);

final ButtonStyle greyPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(172, 48),
  backgroundColor: secondGrey,
  elevation: 1,
);

final ButtonStyle longYellow = ElevatedButton.styleFrom(
  minimumSize: const Size(500, 48),
  backgroundColor: mainYellow,
  elevation: 1,
);

final ButtonStyle longwhite = ElevatedButton.styleFrom(
  minimumSize: const Size(500, 48),
  backgroundColor: whiteBG,
  elevation: 1,
);

class dashboardButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;// Optional custom ButtonStyle

  const dashboardButton({
    required this.text,
    required this.imagePath,
    required this.onPressed, // Optional custom ButtonStyle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
      child: Expanded(
        flex: 1,
        child: SizedBox(
          height: 175.0,
          width: 175.0,
          child: FloatingActionButton(
            backgroundColor: mainYellow, // Assuming mainYellow is defined elsewhere
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0.0,
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  height: 120.0,
                  width: 170.0,
                ),
                Text(text, style: CustomTextStyle.primaryBlack), // Assuming CustomTextStyle is defined elsewhere
              ],
            ),
            // Apply custom button style if provided

          ),
        ),
      ),
    );
  }
}
