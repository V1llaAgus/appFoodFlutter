import 'package:flutter/material.dart';

import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';
import 'package:foodapp/src/features/presentation/tabs/PageTab/ViewModel/tabs_page_viewmodel.dart';

//TABS
import 'package:foodapp/src/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/favourite_tab/View/favourite_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:foodapp/src/features/presentation/tabs/profile_tab/View/profile_tab.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';
import 'package:provider/provider.dart';

import '../../../../../Base/Views/base_view.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {
  //dependencias

  final TabsPageViewModel viewModel;

  _TabsPageState({TabsPageViewModel? tabsViewModel})
      : viewModel = tabsViewModel ?? DefaultTabsPageViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final LocationPermissionStatus currentStatus =
          await viewModel.getPermisionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCuttertPosition(context);
          break;
        default:
          viewModel.loadingState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab(),
  ].cast<Widget>();

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    viewModel.initState(
        loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            body: _widgetOptions.elementAt(_selectedItemIndex),
            bottomNavigationBar: _bottomNavigationBar(context),
          );
  }
}

extension PrivateMethods on _TabsPageState {
  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: bgGreyPage,
        iconSize: 30.0,
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _changeWidget,
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
        ]);
  }

  Future _getCuttertPosition(BuildContext context) async {
    showAlertDialog(
        context,
        const AssetImage('assets/images/location.png'),
        'Enable Your Location',
        "Please allow to use your location to show nearby restaurant on the map.",
        'Enable Your Location',
        createButton(
            context: context,
            buttonColor: orange,
            labelButton: 'Enable Location',
            func: () {
              viewModel.getCurrenPosition().then((result) {
                switch (result.status) {
                  case ResultStatus.success:
                    _closeAlertDialog(context);
                    break;
                  case ResultStatus.error:
                    _closeAlertDialog(context);
                    errorStateProdiver.setFailure(
                        context: context, value: result.error!);
                    break;
                }
              });
            }));
  }

  void _closeAlertDialog(BuildContext context) {
    viewModel.loadingState.setLoadingState(isLoading: false);
    Navigator.pop(context);
  }
}

extension UserAction on _TabsPageState {
  void _changeWidget(int index) {
    // ignore: invalid_use_of_protected_member
    setState(() {
      _selectedItemIndex = index;
    });
  }
}
