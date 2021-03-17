import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/ui/user_detail.dart';
import 'package:day03_ex/ui/widgets/circle_loading_image.dart';
import 'package:day03_ex/ui/widgets/rouned_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.user, {Key key}) : super(key: key);

  final User user;

  final itemHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    // Issue Brightness
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent, // status bar color
      ),
    );

    return Container(
      padding: EdgeInsets.all(Dimens.gap_dp16),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          // BoxShadow(
          //   color: Co,
          //   blurRadius: 16,
          //   offset: Offset(0, 1),
          // )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleLoadingImage(
            "${user.picture.largeImg}",
            width: itemHeight,
            height: itemHeight,
          ),
          Gaps.hGap16,
          Expanded(
            child: _buildUserInfo(context),
          ),
          Container(
            width: 40,
            height: itemHeight,
            child: Center(
              child: RoundedIconButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(
                        user: user,
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.all(16),
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: itemHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name.toString(),
                  style: Theme.of(context).textTheme.headline2),
              Gaps.vGap8,
              Text(user.location.country,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          Row(
            children: [
              _buildIconText(context, user.phone),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconText(BuildContext context, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.phone_android_outlined, size: 16),
        Gaps.hGap8,
        Text(
          "${user.phone}",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: Dimens.font_sp16),
        ),
      ],
    );
  }
}
