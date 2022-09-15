
import 'package:shared_preferences/shared_preferences.dart';

class ManageSharedPreferences{
  static var isNewUser;

  Future<bool> loadSeenOnBoardingScreens() async {
    final prefs = await SharedPreferences.getInstance();

    return (prefs.getBool('seenOnboardingScreens') ?? false);

  }


  Future<void> setSeenOnBoardingScreens(bool value) async {
    final prefs = await SharedPreferences.getInstance();

// set value
    await prefs.setBool('seenOnboardingScreens', value);
  }
}

//Load a boolean value to determine if the onboarding screens were already seen or not
