import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_tabledata')) {
        try {
          _tabledata = jsonDecode(prefs.getString('ff_tabledata') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _xaxis =
          prefs.getStringList('ff_xaxis')?.map(int.parse).toList() ?? _xaxis;
    });
    _safeInit(() {
      _yaxis =
          prefs.getStringList('ff_yaxis')?.map(double.parse).toList() ?? _yaxis;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _tabledata = jsonDecode(
      '[{\"transaction_id\":\"TXN001\",\"date\":\"2024-08-01\",\"amount\":5000,\"currency\":\"INR\",\"type\":\"credit\",\"sender\":\"KrishiMandi Co-op\",\"receiver\":\"Farmer Ramesh\"},{\"transaction_id\":\"TXN002\",\"date\":\"2024-08-03\",\"amount\":12000,\"currency\":\"INR\",\"type\":\"debit\",\"sender\":\"Farmer Suresh\",\"receiver\":\"Fertilizer Shop\"},{\"transaction_id\":\"TXN003\",\"date\":\"2024-08-05\",\"amount\":7500,\"currency\":\"INR\",\"type\":\"credit\",\"sender\":\"Grain Market\",\"receiver\":\"Farmer Anita\"},{\"transaction_id\":\"TXN004\",\"date\":\"2024-08-08\",\"amount\":9000,\"currency\":\"INR\",\"type\":\"debit\",\"sender\":\"Farmer Ramesh\",\"receiver\":\"Seed Supplier\"},{\"transaction_id\":\"TXN005\",\"date\":\"2024-08-10\",\"amount\":6000,\"currency\":\"INR\",\"type\":\"credit\",\"sender\":\"Vegetable Market\",\"receiver\":\"Farmer Geeta\"},{\"transaction_id\":\"TXN006\",\"date\":\"2024-08-12\",\"amount\":15000,\"currency\":\"INR\",\"type\":\"debit\",\"sender\":\"Farmer Vinod\",\"receiver\":\"Tractor Dealer\"},{\"transaction_id\":\"TXN007\",\"date\":\"2024-08-15\",\"amount\":8000,\"currency\":\"INR\",\"type\":\"credit\",\"sender\":\"Local Grain Market\",\"receiver\":\"Farmer Suresh\"},{\"transaction_id\":\"TXN008\",\"date\":\"2024-08-17\",\"amount\":9500,\"currency\":\"INR\",\"type\":\"debit\",\"sender\":\"Farmer Anita\",\"receiver\":\"Irrigation Supplier\"},{\"transaction_id\":\"TXN009\",\"date\":\"2024-08-20\",\"amount\":5000,\"currency\":\"INR\",\"type\":\"credit\",\"sender\":\"Fruit Market\",\"receiver\":\"Farmer Geeta\"},{\"transaction_id\":\"TXN010\",\"date\":\"2024-08-22\",\"amount\":11000,\"currency\":\"INR\",\"type\":\"debit\",\"sender\":\"Farmer Vinod\",\"receiver\":\"Pesticide Supplier\"}]');
  dynamic get tabledata => _tabledata;
  set tabledata(dynamic value) {
    _tabledata = value;
    prefs.setString('ff_tabledata', jsonEncode(value));
  }

  List<int> _xaxis = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> get xaxis => _xaxis;
  set xaxis(List<int> value) {
    _xaxis = value;
    prefs.setStringList('ff_xaxis', value.map((x) => x.toString()).toList());
  }

  void addToXaxis(int value) {
    xaxis.add(value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void removeFromXaxis(int value) {
    xaxis.remove(value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXaxis(int index) {
    xaxis.removeAt(index);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void updateXaxisAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    xaxis[index] = updateFn(_xaxis[index]);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXaxis(int index, int value) {
    xaxis.insert(index, value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  List<double> _yaxis = [
    2331.0,
    2341.0,
    2370.0,
    2671.0,
    2885.0,
    2377.0,
    2462.0,
    3400.0,
    2430.0,
    2534.0
  ];
  List<double> get yaxis => _yaxis;
  set yaxis(List<double> value) {
    _yaxis = value;
    prefs.setStringList('ff_yaxis', value.map((x) => x.toString()).toList());
  }

  void addToYaxis(double value) {
    yaxis.add(value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void removeFromYaxis(double value) {
    yaxis.remove(value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYaxis(int index) {
    yaxis.removeAt(index);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void updateYaxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    yaxis[index] = updateFn(_yaxis[index]);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYaxis(int index, double value) {
    yaxis.insert(index, value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
