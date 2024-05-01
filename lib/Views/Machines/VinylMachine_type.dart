import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/Machines/PrintCutMachine.dart';
import 'package:jmaker_fablab/Views/Machines/VinylCutterMachine.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/color.dart';


class VinylMachineType extends StatelessWidget {
  const VinylMachineType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                //Text Headings
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [ // Removed redundant crossAxisAlignment
                        FloatingActionButton(
                          backgroundColor: whiteBG,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: blackGreen, // Used color property for icon color
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Choose Machine Model',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            'There are two machines.',
                            style: CustomTextStyle.secondaryGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
                //Student Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: blackGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VinylCutter()),
                          );
                        },// navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Y_VINYL.png',
                              fit: BoxFit.contain,
                              height: 200,
                              width: 2000,
                            ),
                            const Text('CAMM-1 GS-24', style:
                            TextStyle(
                              color: mainYellow,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: blackGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PrintCut()
                            ),
                          );
                        }, // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Y_VINYL.png',
                                fit: BoxFit.contain,
                                height: 200,
                                width:200,
                              ),
                            ),
                            const Text('Roland TrueVIS VG3-640', style:
                                TextStyle(
                                  color: mainYellow,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
