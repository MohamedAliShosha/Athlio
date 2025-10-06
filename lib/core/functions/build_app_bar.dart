import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {Widget? leadingWidget}) {
  return AppBar(
    elevation: 0,
    leading: leadingWidget,
  );
}
