

import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/custom_rewards_history_containers.dart';

class RewardsHistory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomRewardsHistoryContainers(rewardText: 'A deposit in Momo of 500 fcfa', rewardDate: '25/07/22'),

            CustomRewardsHistoryContainers(rewardText: 'A deposit in Momo of 500 fcfa', rewardDate: '25/07/22'),

            CustomRewardsHistoryContainers(rewardText: 'A deposit in Momo of 500 fcfa', rewardDate: '25/07/22'),

          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}