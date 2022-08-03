import 'package:flutter/material.dart';

class CustomRewardsHistoryContainers extends StatelessWidget {
  final String rewardText;
  final String rewardDate;

  const CustomRewardsHistoryContainers(
      {Key? key, required this.rewardText, required this.rewardDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    rewardText,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    rewardDate,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF868686)),
                  ),
                ),
              ],
            )));

  }
}
