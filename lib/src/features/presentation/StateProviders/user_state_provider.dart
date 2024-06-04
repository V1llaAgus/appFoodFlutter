import 'package:flutter/material.dart';

abstract class UserStateProviderDelegate {}

class UserStateProvider extends ChangeNotifier with UserStateProviderDelegate {}
