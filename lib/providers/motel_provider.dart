import 'package:flutter/foundation.dart';

import '../models/motel.dart';
import '../services/motel_service.dart';

class MotelProvider with ChangeNotifier {
  final MotelService _motelService = MotelService();
  List<Motel> _motels = [];
  bool _isLoading = false;
  String? _error;

  List<Motel> get motels => _motels;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMotels() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _motels = await _motelService.getMotels();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
