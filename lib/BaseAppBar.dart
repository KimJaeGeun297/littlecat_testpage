import "package:flutter/material.dart";

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar? appBar;
  const BaseAppBar({Key? key, @required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Voucher | LittleCat'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
