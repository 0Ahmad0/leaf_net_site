import 'package:leaf_net_app/core/assets_manager.dart';
import 'package:leaf_net_app/core/models/home_model.dart';
import 'package:leaf_net_app/core/models/navbar_model.dart';
import 'package:leaf_net_app/core/strings_manager.dart';
import 'package:leaf_net_app/features/navbar/screens/home_screen.dart';
import 'package:leaf_net_app/features/navbar/screens/profile_screen.dart';

class ConstManager {
  static final double width = 1440.0;
  static final double height = 1400.0;

  static final int splashTime = 5;

  static List<NavbarModel> appBarPages = [
    NavbarModel(name: StringsManager.homeText, screen: HomeScreen()),

    NavbarModel(name: StringsManager.profileText, screen: ProfileScreen()),
  ];

  static List<HomeModel> homeList = [
    HomeModel(
      name: StringsManager.diagnosePlantText,
      image:  AssetsManager.diagnosePlantIMG,
      route: 'route',
    ),
    HomeModel(
      name: StringsManager.askExpertText,
      image:  AssetsManager.askExpertIMG,
      route: 'route',
    ),
  ];
}
