import 'package:flutter/material.dart';

class PageModel {
  String _title, _description, _image;
  IconData _icon;
  PageModel(this._title, this._description, this._icon, this._image);
  String get title => _title;
  String get description => _description;
  IconData get icon => _icon;
  String get image => _image;
}
