import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:life_skills_app/components/course_item.dart';
import 'package:life_skills_app/models/course_model.dart';
import 'package:life_skills_app/resources/app_color.dart';

class AllCoursePage extends StatefulWidget {
  final Map<String, List<CourseModel>> map;

  AllCoursePage(this.map);

  @override
  State<StatefulWidget> createState() => _AllCoursePageState();
}

class _AllCoursePageState extends State<AllCoursePage>
    with AutomaticKeepAliveClientMixin<AllCoursePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: widget.map.keys
          .map((key) => SliverStickyHeader(
                header: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Text(
                    key,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.h5E5E5E,
                        fontSize: 16),
                  ),
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => CourseItem(widget.map[key][index]),
                    childCount: widget.map[key].length,
                  ),
                ),
              ))
          .toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
