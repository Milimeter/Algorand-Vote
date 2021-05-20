import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/controller/user_controller.dart';
import 'package:algorand_vote/screen/control/donate_list.dart';
import 'package:algorand_vote/screen/control/vote_list.dart';
import 'package:algorand_vote/screen/control/webview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final AppController _appController = Get.find();

//   final _advancedDrawerController = AdvancedDrawerController();

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return AdvancedDrawer(
//       backdropColor: Colors.deepPurple,
//       controller: _advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       childDecoration: const BoxDecoration(
//         // NOTICE: Uncomment if you want to add shadow behind the page.
//         // Keep in mind that it may cause animation jerks.
//         // boxShadow: <BoxShadow>[
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 0.0,
//         //   ),
//         // ],
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       ),
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               child: CustomPaint(
//                 size: Size(
//                     size.width,
//                     (size.width * 0.6)
//                         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                 painter: RPSCustomPainter(),
//               ),
//             ),
// Positioned(
//   top: 25,
//   left: 10,
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//       ),
//       child: IconButton(
//         onPressed: _handleMenuButtonPressed,
//         icon: ValueListenableBuilder<AdvancedDrawerValue>(
//           valueListenable: _advancedDrawerController,
//           builder: (context, value, child) {
//             return Icon(
//               value.visible ? Icons.clear : Icons.menu,
//             );
//           },
//         ),
//       ),
//     ),
//   ),
// ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //SizedBox(height: 50),
//                   Image.asset(cast),
//                   Text(
//                     "If you want to cast your vote",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   CustomButton(
//                     text: "Participate",
//                     onTap: () {},
//                     bgColor: Colors.deepPurple,
//                   ),
//                   Image.asset(conduct),
//                   Text(
//                     "If you want to conduct an election",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   CustomButton(
//                     text: "Conduct",
//                     onTap: () {},
//                     bgColor: Colors.deepPurple,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       drawer: SafeArea(
//         child: Container(
//           child: ListTileTheme(
//             textColor: Colors.white,
//             iconColor: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: 128.0,
//                   height: 128.0,
//                   margin: const EdgeInsets.only(
//                     top: 24.0,
//                     bottom: 64.0,
//                   ),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     color: Colors.black26,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'assets/images/flutter_logo.png',
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.home),
//                   title: Text('Home'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.account_circle_rounded),
//                   title: Text('Profile'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.favorite),
//                   title: Text('Favourites'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.settings),
//                   title: Text('Settings'),
//                 ),
//                 Spacer(),
//                 DefaultTextStyle(
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white54,
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 16.0,
//                     ),
//                     child: Text('Terms of Service | Privacy Policy'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//     _advancedDrawerController.showDrawer();
//   }
// }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint_0 = new Paint()
//       ..color = Colors.deepPurple
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.0037500, size.height * 0.0133333);
//     path_0.lineTo(size.width * 0.9887500, size.height * 0.0100000);
//     path_0.quadraticBezierTo(size.width * 0.9915625, size.height * 0.5025000,
//         size.width * 0.9925000, size.height * 0.6666667);
//     path_0.cubicTo(
//         size.width * 0.8875000,
//         size.height * 0.8258333,
//         size.width * 0.6728125,
//         size.height * 0.6691667,
//         size.width * 0.5662500,
//         size.height * 0.6700000);
//     path_0.quadraticBezierTo(size.width * 0.2500000, size.height * 0.5300000,
//         size.width * 0.0012500, size.height * 0.2433333);
//     path_0.lineTo(size.width * 0.0037500, size.height * 0.0133333);
//     path_0.close();

//     canvas.drawPath(path_0, paint_0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class HomeScreen extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget customContainer({String image, String text1, String text2}) =>
        Container(
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue[800],
                  Colors.deepPurple,
                ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(image, width: 50),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      text1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => image == person
                            ? Get.to(DonateList())
                            : Get.to(VoteList()),
                        child: Container(
                          padding: const EdgeInsets.all(11.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: AutoSizeText(
                            text2,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    Widget electionContainer(
            {String image, String text1, String text2, String text3}) =>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
                SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      text1,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    AutoSizeText(
                      text2,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    AutoSizeText(
                      text3,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );

    final UserController _userController = Get.find();
    print(_userController.userData.value.name);
    return AdvancedDrawer(
      backdropColor: Colors.deepPurple,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
          body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.10),
                child: Column(
                  children: [
                    Text(
                      _userController.userData.value.name ?? "Welcome User",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    customContainer(
                      image: user,
                      text1: "Click here to Vote",
                      text2: "Vote now",
                    ),
                    SizedBox(height: 20),
                    customContainer(
                      image: person,
                      text1: "Click here to Donate",
                      text2: "Donate now",
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "Latest Election",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            "See All",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    electionContainer(
                      image: finegirl,
                      text1: "Joe Howard",
                      text2: "Arrow Party",
                      text3: "As CTO officer E",
                    ),
                    SizedBox(height: 10),
                    electionContainer(
                      image: duhh,
                      text1: "Tom Watson",
                      text2: "Wimboc Party",
                      text3: "As CTO officer E",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                  child: IconButton(
                    onPressed: _handleMenuButtonPressed,
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: _advancedDrawerController,
                      builder: (context, value, child) {
                        return Icon(
                          value.visible ? Icons.clear : Icons.menu,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/flutter_logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Switch'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(WebviewPage(
                      url: "https://wallet.myalgo.com/",
                    ));
                  },
                  leading: Icon(Icons.web_asset),
                  title: Text('Algo Wallet'),
                ),
                ListTile(
                  onTap: () {
                     Get.to(WebviewPage(
                      url: "https://testnet.algoexplorer.io/",
                    ));
                  },
                  leading: Icon(Icons.web_asset),
                  title: Text('Testnet Explorer'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
