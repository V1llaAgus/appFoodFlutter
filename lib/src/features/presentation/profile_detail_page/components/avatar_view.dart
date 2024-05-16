import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';

//STYLE
import 'package:foodapp/src/utils/Styles/box_decoration_shadow.dart';

class AvatarView extends StatelessWidget {
  final String backgroundImage;

  const AvatarView({Key? key, required this.backgroundImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: createBoxDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(backgroundImage: AssetImage(backgroundImage)),
        ),
        Transform.translate(
          offset: const Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: pink, borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.camera_alt,
              color: white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
