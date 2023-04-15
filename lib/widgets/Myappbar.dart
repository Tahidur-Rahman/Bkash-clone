import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final GlobalKey<_MyAppBarState> appBar_key = new GlobalKey<_MyAppBarState>();
  bool _isAnimation = false;
  bool _isBalanceShown = false;
  bool _isBalance = true;
  void animate() async {
    _isAnimation = true;
    _isBalance = false;

    await Future.delayed(Duration(microseconds: 800),
        () => setState(() => _isBalanceShown = true));

    await Future.delayed(
        Duration(seconds: 3),
        () => setState(
              () => _isBalanceShown = false,
            ));
    await Future.delayed(Duration(milliseconds: 200),
        () => setState(() => _isAnimation = false));
    await Future.delayed(
        Duration(milliseconds: 800), () => setState(() => _isBalance = true));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: appBar_key,
      flexibleSpace: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12, bottom: 4),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage('assets/profile.png'),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Tahidur Rahman',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: animate,
                    child: Container(
                      width: 160,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //Amount
                          AnimatedOpacity(
                              opacity: _isBalanceShown ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text('৳ 7500.25',
                                  style: TextStyle(
                                      color: Colors.pink, fontSize: 14))),

                          //Balance
                          AnimatedOpacity(
                              opacity: _isBalance ? 1 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Text('Tap for balance',
                                  style: TextStyle(
                                      color: Colors.pink, fontSize: 14))),
                          //Circle
                          AnimatedPositioned(
                              left: _isAnimation ? 135 : 5,
                              curve: Curves.fastOutSlowIn,
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const FittedBox(
                                  child: Text('৳',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17)),
                                ),
                              ),
                              duration: const Duration(microseconds: 1100))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
      )),
    );
  }
}
