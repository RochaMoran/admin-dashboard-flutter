import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/foundation.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedusers();
  }

  getPaginatedusers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final userResponse = UsersResponse.fromMap(resp);
    users = [...userResponse.usuarios];

    isLoading = false;

    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(User user) getField) {
    users.sort((a, b) {
      if (a != null && b != null) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
      } else {
        return 0;
      }
    });

    ascending = !ascending;
    notifyListeners();
  }
}