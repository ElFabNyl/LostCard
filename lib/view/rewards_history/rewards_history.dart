import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/custom_rewards_history_containers.dart';

class RewardsHistory extends StatelessWidget {
  const RewardsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              CustomRewardsHistoryContainers(
                  rewardText: 'A deposit in Momo of 500 fcfa',
                  rewardDate: '25/07/22'),
              SizedBox(
                height: 20,
              ),
              CustomRewardsHistoryContainers(
                  rewardText: 'A deposit in Momo of 500 fcfa',
                  rewardDate: '25/07/22'),
              SizedBox(
                height: 20,
              ),
              CustomRewardsHistoryContainers(
                  rewardText: 'A deposit in Momo of 500 fcfa',
                  rewardDate: '25/07/22'),
            ],
          ),
        ),
      ),
    );
  }
}
