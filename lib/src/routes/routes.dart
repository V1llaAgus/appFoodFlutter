import 'package:flutter/material.dart';
import 'package:foodapp/src/features/presentation/LoginPage/View/login_page.dart';
import 'package:foodapp/src/features/presentation/places_detail_page/View/place_detail_page.dart';
import 'package:foodapp/src/features/presentation/profile_detail_page/View/profile_detail_page.dart';

import 'package:foodapp/src/features/presentation/welcome_page/View/welcome_page.dart';

import 'package:foodapp/src/features/presentation/forgot_password_page/View/forgot_password.dart';
import 'package:foodapp/src/features/presentation/sing_up_page/View/sing_up_page.dart';
import 'package:foodapp/src/features/presentation/tabs/tabs_page.dart';
import 'package:foodapp/src/features/presentation/search_page/View/search_views.dart';
import 'package:foodapp/src/features/presentation/filter_page/View/filter_page.dart';
import 'package:foodapp/src/features/presentation/collections_page/collections_view.dart';
import 'package:foodapp/src/features/presentation/collections_detail_page/View/collection_detail_page.dart';

//PAGES

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => const WelComePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => const ForgotPassword(),
  'sing-up': (BuildContext context) => SingUpPage(),
  'tabs': (BuildContext context) => const TabsPage(),
  'search': (BuildContext context) => const SearchPage(),
  'filter': (BuildContext context) => const FilterPage(),
  'collections': (BuildContext context) => const CollectionPage(),
  'collections-detail': (BuildContext context) => const CollectionDetailPage(),
  'place-detail': (BuildContext context) => const PlaceDetailPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
};
