import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/text_style.dart';

import '../../styles/color.dart';

class NoContent extends StatelessWidget {
  const NoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: blackGreen,
            size: 24,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/cat.png',
          height: 200,),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Text('Sorry, there are none available', style: CustomTextStyle.boldHeader,),
            ),
          )
        ],
      ),
    );
  }
}
