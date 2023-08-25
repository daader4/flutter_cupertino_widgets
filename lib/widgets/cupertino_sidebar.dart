import 'package:flutter/cupertino.dart';

class CupertinoSidebar {
  final List<Widget> sidebarItems;
  final Color color;
  final String? title;
  final Widget? footer;

  CupertinoSidebar({
    required this.sidebarItems,
    required this.color,
    this.title,
    this.footer,
  });
}