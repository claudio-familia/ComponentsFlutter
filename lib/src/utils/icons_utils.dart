import 'package:flutter/material.dart';

Map<String, IconData> _icons = {
  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'live_tv'       : Icons.live_tv,
  'send'          : Icons.send,
};


Icon getIconFromString(String iconName, Color color) {
  return Icon(_icons[iconName], color: color,);
}