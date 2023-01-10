import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../component/constant.dart';
import '../controller/controller.dart';
import '../layout/layout.dart';
import '../utils/config.dart';
import '../widgets/button.dart';
import '../widgets/cubes.dart';
import '../widgets/scoreboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TicTacToeController ticTacToeController =
  Get.put(TicTacToeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<TicTacToeController>(builder: (_) {
      return CustomLayout(
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 7),
                child: ScoreboardWidget(
                  xScore: ticTacToeController.xScore,
                  yScore: ticTacToeController.yScore,
                ),
              ),
              for (var i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var j = 0; j < 3; j++)
                      GestureDetector(
                          onTap: () {
                            ticTacToeController.onUserClick(i, j);
                          },
                          child: CubesWidget(
                            i: i,
                            j: j,
                            displayElement: ticTacToeController.data[i][j],
                          ))
                  ],
                ),
              Padding(
                  padding:
                  EdgeInsets.only(top: SizeConfig.safeBlockVertical * 10),
                  child: ButtonWidget(
                      onPressed: () => {ticTacToeController.onNewGameClick()},
                      text: Constants.newGameText)),
              Padding(
                  padding:
                  EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1.4),
                  child: ButtonWidget(
                      onPressed: () => {ticTacToeController.onResetClick()},
                      text: Constants.resetGameText))
            ],
          ),
        ),
      );
    });
  }
}
