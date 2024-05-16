import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';



class ListTileCheck extends StatefulWidget {
  final String texto;
  final bool isActive;
  final VoidCallback? func; // Cambia el tipo a VoidCallback?

  const ListTileCheck(
      {Key? key, required this.texto, required this.isActive, this.func})
      : super(key: key);

  @override
  State<ListTileCheck> createState() => _ListTileCheckState();
}

class _ListTileCheckState extends State<ListTileCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listTiles(
            context: context,
            texto: widget.texto,
            isActive: widget.isActive,
            func: widget.func)
      ],
    );
  }
}

Widget listTiles(
    {required BuildContext context,
    required String texto,
    isActive = bool,
    VoidCallback? func}) {
  return Container(
    decoration: BoxDecoration(
      
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
        onTap: func,
        title: headerText(
          texto: texto,
          
          color: isActive ? orange : black,
          fontWeight: FontWeight.w300,
          fontSize: 17,
        ),
        trailing: isActive
            ? Icon(
                Icons.check,
                color: isActive ? orange : gris,
              )
            : const Text('')),
  );
}
