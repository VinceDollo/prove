import 'package:flutter/cupertino.dart';

import 'package:flutter_starter/model/api/response/user.dart';

/// Pour des test
abstract class IHomeViewmodel extends ChangeNotifier{

}

class HomeViewmodel extends IHomeViewmodel {
  HomeViewmodel(this._user);

  final User _user;
}
