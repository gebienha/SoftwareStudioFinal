import 'package:flutter/material.dart';

class AvatarNotifier extends ChangeNotifier {
  String _avatarSvgData = '';
  String get avatarSvgData => _avatarSvgData;

  void setAvatarSvgData(String svgData) {
    _avatarSvgData = svgData;
    notifyListeners();
  }
}
