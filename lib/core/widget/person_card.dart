import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_desk/core/data/models/user_data.dart';
import 'package:help_desk/global_constants.dart';

///Сорри, без тем оформления, в лоб, взял из какого-то юай кита
class PersonCard extends StatelessWidget {
  final UserData user;

  PersonCard(this.user);

  @override
  Widget build(BuildContext context) {
    final userThumbnail = Container(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        alignment: FractionalOffset.centerLeft,
        child: SvgPicture.asset(PathPictures.IC_AVAILABLE,
            height: 92.0, fit: BoxFit.contain));

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    final userCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(user.name, style: headerTextStyle),
          Container(height: 10.0),
          Text(user.username, style: subHeaderTextStyle),
          Row(
            children: <Widget>[
              Expanded(child: Text(user.company.name, style: regularTextStyle)),
              Expanded(child: Text(user.email, style: regularTextStyle))
            ],
          ),
        ],
      ),
    );

    final userCard = Container(
      child: userCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            userCard,
            userThumbnail,
          ],
        ));
  }
}
