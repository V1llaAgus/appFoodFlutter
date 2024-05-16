import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';

//TABS
import 'package:foodapp/src/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/profile_tab/View/profile_tab.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pedirLocation(context);
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab(),
  ].cast<Widget>();

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: bgGreyPage,
      iconSize: 30.0,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _cambiarWidget,
      showUnselectedLabels: true,
      type: BottomNavigationBarType
          .fixed, // Ajusta el tipo de barra de navegación
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'My Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Profile',
        ),
      ],
    );
  }
}

Future _pedirLocation(BuildContext context) async {
  showAlertDialog(
    context,
    const AssetImage('assets/images/location.png'),
    'Enable Your Location',
    "Please allow to use your location to show nearby restaurant on the map.",
    'Enable Your Location',
    "Por el momento no quiero" as Widget,
  );
}
