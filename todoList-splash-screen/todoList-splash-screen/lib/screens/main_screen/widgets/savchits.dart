// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:rive/rive.dart';

// Project imports:
import 'package:to_do_list_pro_project/screens/main_screen/widgets/bottom_nav_bar_widget.dart';
import 'package:to_do_list_pro_project/theme/themes.dart';

class SavchitsPage extends StatefulWidget {
  const SavchitsPage({Key? key}) : super(key: key);

  @override
  _SavchitsPageState createState() => _SavchitsPageState();
}

class _SavchitsPageState extends State<SavchitsPage> {
  RiveAnimationController? _controller;

  bool _loaded = true;
  @override
  void initState() {
    next();
    super.initState();
    _controller = SimpleAnimation(
      '2',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  void next() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _loaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A202F),
      // appBar: ,
      body: Padding(
        padding: const EdgeInsets.only(left: 21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160.0,
            ),
            SizedBox(
              width: 256,
              height: 212,
              child: RiveAnimation.asset('assets/rive/3.riv',
                  controllers: [_controller!]),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'The future is the result of your choice',
              style: TextStyles.header3.copyWith(
                color: (_loaded) ? Color(0xff1A202F) : ColorPalette.grey01,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'We will help to make it light',
              style: TextStyles.subtitle5.copyWith(
                color: (_loaded) ? Color(0xff1A202F) : Color(0xff4E5461),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 126.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 55.0,
              child: GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyBottomNavbar(),
                      ));
                }),
                child: Row(
                  children: [
                    SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/logo.svg',
                        color: (_loaded) ? Color(0xff1A202F) : null,
                      ),
                    ),SizedBox(width: 25,),
                    Text(
                      'Login with Google',
                      style: TextStyles.header1.copyWith(
                        color:
                            (_loaded) ? Color(0xff1A202F) : ColorPalette.grey01,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (_loaded) ? Color(0xff1A202F) : ColorPalette.black2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                color: (_loaded) ? Color(0xff1A202F) : null,
                child: RichText(
                    text: TextSpan(
                        text: 'By continuing, you agree to  ',
                        style: TextStyles.subtitle3.copyWith(
                          color: (_loaded)
                              ? Color(0xff1A202F)
                              : ColorPalette.grey02,
                          fontSize: 10,
                        ),
                        children: [
                      TextSpan(
                        text: 'Terms and Privacy Policy',
                        recognizer: TapGestureRecognizer(),
                        style: TextStyles.subtitle3.copyWith(
                          decoration: TextDecoration.underline,
                          color: (_loaded)
                              ? Color(0xff1A202F)
                              : ColorPalette.grey02,
                          fontSize: 10.0,
                        ),
                      )
                    ]))
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'By continuing, you agree to',
                //       style: TextStyles.subtitle3.copyWith(
                //           color:
                //               (_loaded) ? Color(0xff1A202F) : ColorPalette.grey5,
                //               fontSize: 10,)
                //     ),
                //     TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           'Terms and Privacy Policy',
                //           style: TextStyles.subtitle3.copyWith(
                //               color: (_loaded)
                //                   ? Color(0xff1A202F)
                //                   : ColorPalette.grey5, fontSize: 10,),
                //         )),
                //   ],
                // ),
                )
          ],
        ),
      ),
    );
  }
}
