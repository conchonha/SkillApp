import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

import 'notification_icon.dart';
import 'utilities_icon.dart';

class LifeSkillsAppBar extends PreferredSize {
  final bool isDashBoard;
  final String title;
  final BuildContext context;
  final VoidCallback onTapLeading;
  final VoidCallback onNotification;
  final bool hasSearch;
  final Key keyTop;
  final void Function(String) onSearch;
  final VoidCallback onCloseSearch;
  final VoidCallback onSearching;

  LifeSkillsAppBar(this.context,
      {this.isDashBoard = false,
      this.title,
      this.onTapLeading,
      this.onNotification,
      this.keyTop,
      this.onSearch,
      this.onCloseSearch,
      this.onSearching,
      this.hasSearch = false});

  @override
  Widget get child => isDashBoard
      ? Container(
          height: 244,
          child: Stack(
            children: [
              Container(
                padding: MediaQuery.of(context).padding,
                height: 171,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: appBar,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        colors: [AppColor.h1885FF, AppColor.h00E0FF])),
              ),
              Positioned(
                child: Container(
                  height: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).lbl_utilities,
                        style: TextStyle(
                            color: AppColor.h5E5E5E,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                          child: Center(
                        child: Row(
                          children: [
                            UtilitiesIcon(
                              icon: AppDrawable.ic_profile,
                              text: S.of(context).lbl_profile,
                            ),
                            Spacer(),
                            UtilitiesIcon(
                              icon: AppDrawable.ic_setting,
                              text: S.of(context).lbl_setting,
                            ),
                            Spacer(),
                            UtilitiesIcon(
                              icon: AppDrawable.ic_find,
                              text: S.of(context).lbl_find,
                            ),
                            Spacer(),
                            UtilitiesIcon(
                              icon: AppDrawable.ic_document,
                              text: S.of(context).lbl_help,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: AppColor.hFFFFFF,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.h000000.withOpacity(0.1),
                            blurRadius: 10)
                      ]),
                ),
                bottom: 0,
                right: 15,
                left: 15,
              )
            ],
          ),
        )
      : Container(
          padding: MediaQuery.of(context).padding,
          child: appBar,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColor.h1885FF, AppColor.h00E0FF])));

  Widget get appBar => TopAppBar(
      title: title,
      onNotification: onNotification,
      onTapLeading: onTapLeading,
      hasSearch: hasSearch,
      key: keyTop,
      onSearch: onSearch,
      onSearching: onSearching,
      onCloseSearch: onCloseSearch);

  @override
  Size get preferredSize =>
      isDashBoard ? Size.fromHeight(244) : Size.fromHeight(kToolbarHeight);
}

class TopAppBar extends StatefulWidget {
  final String title;
  final VoidCallback onTapLeading;
  final VoidCallback onNotification;
  final bool hasSearch;
  final void Function(String) onSearch;
  final VoidCallback onCloseSearch;
  final VoidCallback onSearching;

  TopAppBar(
      {this.title,
      this.onTapLeading,
      this.onNotification,
      Key key,
      this.onSearch,
      this.onCloseSearch,
      this.onSearching,
      this.hasSearch = false})
      : super(key: key);

  @override
  TopAppBarState createState() => TopAppBarState();
}

class TopAppBarState extends State<TopAppBar> {
  bool isSearch = false;
  final focusSearch = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: isSearch
          ? Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 23, right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 0),
                            color: AppColor.hFFFFFF.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(200)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: widget.onSearch,
                                  focusNode: focusSearch,
                                  style: TextStyle(
                                      color: AppColor.hFFFFFF, fontSize: 14),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      prefixIconConstraints: BoxConstraints(),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 17, right: 12),
                                        child: SvgPicture.asset(
                                            AppDrawable.ic_search_top),
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 17, left: 12),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSearch = false;
                                  });

                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  widget.onCloseSearch?.call();
                                },
                                child: SvgPicture.asset(AppDrawable.ic_close),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                InkWell(
                    child: NotificationIcon(),
                    onTap: () {
                      widget.onNotification?.call();
                    }),
              ],
            )
          : Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(widget.title ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.hFFFFFF,
                          fontWeight: FontWeight.w600)),
                ),
                Row(
                  children: [
                    SizedBox(width: 21),
                    InkWell(
                      onTap: () {
                        widget.onTapLeading?.call();
                      },
                      child: SvgPicture.asset(AppDrawable.ic_menu),
                    ),
                    Spacer(),
                    if (widget.hasSearch)
                      Padding(
                        padding: const EdgeInsets.only(right: 23),
                        child: InkWell(
                          child: SvgPicture.asset(AppDrawable.ic_search),
                          onTap: () {
                            setState(() {
                              isSearch = true;
                            });

                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              FocusScope.of(context).requestFocus(focusSearch);
                            });
                            widget.onSearching?.call();
                          },
                        ),
                      ),
                    InkWell(
                        child: NotificationIcon(),
                        onTap: () {
                          widget.onNotification?.call();
                        }),
                  ],
                )
              ],
            ),
    );
  }

  void offSearch() {
    setState(() {
      isSearch = false;
    });
  }
}
