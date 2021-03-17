import 'dart:async';

import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/ui/widgets/circle_loading_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserDetailPage extends StatefulWidget {
  final User user;

  const UserDetailPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  bool isShowMapView = false;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isShowMapView = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimens.gap_dp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: CircleAvatar(
                  child: CircleLoadingImage(
                    widget.user.picture.largeImg,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  radius: 32,
                ),
              ),
              Gaps.vGap24,
              SizedBox(
                width: double.infinity,
                child: Text(
                  "User profile",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Gaps.vGap24,
              _buildUserInfoItem(context,
                  title: "UserName", value: user.name.toString()),
              Gaps.vGap24,
              _buildUserInfoItem(context, title: "Email", value: user.email),
              Gaps.vGap24,
              _buildUserInfoItem(context, title: "Phone", value: user.phone),
              Gaps.vGap24,
              _buildUserInfoItem(context, title: "Gender", value: user.gender),
              Gaps.vGap24,
              _buildUserInfoItem(context,
                  title: "Date of birth", value: user.dob.toString()),
              Gaps.vGap24,
              _buildUserInfoItem(context, title: "Location", value: ""),
              Gaps.vGap24,
              Expanded(
                child: isShowMapView ? _buildUserLocation() : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserLocation() {
    final user = widget.user;

    return GoogleMap(
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(
          user.location.latitude,
          user.location.longitude,
        ),
        zoom: 16.0,
      ),
    );
  }

  Widget _buildUserInfoItem(BuildContext context, {String title, value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.grey)),
        Text(capitalize(value),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(letterSpacing: 1)),
      ],
    );
  }

  String capitalize(String value) {
    if (value.length == 0) return value;
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }
}
