import 'package:flutter/material.dart';

class MyDrawerTile extends StatefulWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  State<MyDrawerTile> createState() => _MyDrawerTileState();
}

class _MyDrawerTileState extends State<MyDrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          widget.text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
          widget.icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
