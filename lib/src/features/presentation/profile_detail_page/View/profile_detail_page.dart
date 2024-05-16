import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';

//WIDGETS
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/profile_detail_page/components/avatar_view.dart';
import 'package:foodapp/src/features/presentation/profile_detail_page/components/textfield_view.dart';
//EXTENCIONS
import 'package:foodapp/src/utils/Extensions/screen_size.dart';
import 'package:foodapp/src/utils/Styles/box_decoration_shadow.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        title: headerText(texto: 'Edit Profile', fontSize: 17),
        backgroundColor: white,
        centerTitle: true,
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: headerText(
                  texto: 'Done',
                  color: orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(
                  top: getScreenHeight(context: context, multiplier: 0.1),
                  left: 15,
                  right: 15),
              decoration:
                  createBoxDecorationWithShadows(borderRadius: borderRadius),
              width: getScreenHeight(context: context),
              height: getScreenHeight(context: context, multiplier: 0.64),
              child: Column(
                children: [
                  Transform.translate(
                      offset: const Offset(0, -60),
                      child: const AvatarView(
                          backgroundImage: 'assets/images/profile.jpg')),
                  const TextFielsdProfileDetailView()
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
