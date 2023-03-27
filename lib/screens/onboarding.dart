import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../styles/font_styles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 50,
            ),
            height: 250,
              alignment: Alignment.center,
              child: const Image(
                  image: AssetImage('assets/images/onboarding.png'),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100,),
            child: Text('Reminders made simple', style:  FontStyles.onbText,),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.navigation);
            },
            enableFeedback: true,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 95,
              ),
              decoration: (BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff5DE61A),
                    Color(0xff39A801),
                  ]
                ),
              )),
              child: Text('Get Started', style: FontStyles.onbButtonText,),
            ),
          )
        ],
      ),
    );
  }
}
