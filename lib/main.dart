import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:tutoro/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin {
  final introKey = GlobalKey<IntroductionScreenState>();
  late AnimationController _controller;
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => login()),
    );
  }
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }
  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/image/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
     return Container(
       color: Colors.white,
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Center(
         child:  Lottie.asset(
           'assets/image/tutoro.json',
           controller: _controller,
           onLoaded: (composition) {
             _controller
               ..duration = composition.duration
               ..forward().whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
                   MaterialPageRoute(builder: (context) => login()), (route) => false
               ));
           },
         ),
       ),
     );
    // return IntroductionScreen(
    //   key: introKey,
    //   globalBackgroundColor: Colors.white,
    //   globalHeader: Align(
    //     alignment: Alignment.topRight,
    //     child: SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.only(top: 16, right: 16),
    //         child: InkWell(
    //           onTap: (){
    //             Navigator.of(context).push(
    //               MaterialPageRoute(builder: (_) => login()),
    //             );
    //           },
    //           child: Text("Skip",
    //             style: TextStyle(
    //               fontSize: 18,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //
    //   pages: [
    //     PageViewModel(
    //       title: "Start To Explore",
    //       body:
    //       "Instead of having to buy an entire share, invest any amount you want.",
    //       image: _buildImage('schl.png'),
    //       decoration: pageDecoration,
    //     ),
    //     PageViewModel(
    //       title: "Start To Explore",
    //       body:
    //       "Download the Stockpile app and master the market with our mini-lesson.",
    //       image: _buildImage('cap1.png'),
    //       decoration: pageDecoration,
    //     ),
    //     PageViewModel(
    //       title: "Start To Explore",
    //       body:
    //       "Kids and teens can track their stocks 24/7 and place trades that you approve.",
    //       image: _buildImage('cap3.png'),
    //       decoration: pageDecoration,
    //     ),
    //     PageViewModel(
    //       title: "Start To Explore",
    //       body:
    //       "tetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
    //       image: _buildImage('cap2.png'),
    //       decoration: pageDecoration,
    //     ),
    //   ],
    //   onDone: () => _onIntroEnd(context),
    //   //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
    //   showSkipButton: false,
    //   skipOrBackFlex: 0,
    //   nextFlex: 0,
    //   showBackButton: true,
    //   //rtl: true, // Display as right-to-left
    //   back: const Icon(Icons.arrow_back),
    //   skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
    //   next: const Icon(Icons.arrow_forward),
    //   done:  Container(
    //     width: 70,
    //     height: 30,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(13),
    //       color: Colors.amber
    //     ),
    //       child: Center(
    //         child: Text('Start', style: TextStyle(
    //             fontWeight: FontWeight.w600,
    //             color: Colors.white,
    //             fontSize: 16
    //         )),
    //       )),
    //   curve: Curves.fastLinearToSlowEaseIn,
    //   controlsMargin: const EdgeInsets.all(16),
    //   controlsPadding: kIsWeb
    //       ? const EdgeInsets.all(12.0)
    //       : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
    //   dotsDecorator: const DotsDecorator(
    //     size: Size(10.0, 10.0),
    //     color: Color(0xFFBDBDBD),
    //     activeSize: Size(22.0, 10.0),
    //     activeShape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
    //     ),
    //   ),
    //   dotsContainerDecorator: const ShapeDecoration(
    //     color: Colors.white,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //     ),
    //   ),
    // );
  }
}

