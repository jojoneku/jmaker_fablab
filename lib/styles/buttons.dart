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

final ButtonStyle manualsButton = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 80),
  backgroundColor: mainYellow,
  elevation: 1,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
  ),
);

 // Import your custom text styles
class MachineButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const MachineButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 80),
        backgroundColor: mainYellow,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: blackGreen), // Use the provided icon
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.biggerBlack, // Apply your custom text style
              ),
              Text(
                subtitle,
                style: CustomTextStyle.secondaryGrey, // Apply your custom text style
              ),
            ],
          ),
        ],
      ),
    );
  }
}
