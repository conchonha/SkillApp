import 'package:flutter/material.dart';
import 'package:life_skills_app/components/course_item.dart';
import 'package:life_skills_app/models/course_model.dart';

class ListCoursePage extends StatefulWidget {
  final List<CourseModel> list;

  ListCoursePage(this.list);

  @override
  State<StatefulWidget> createState() => _ListCoursePageState();
}

class _ListCoursePageState extends State<ListCoursePage>
    with AutomaticKeepAliveClientMixin<ListCoursePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
        itemBuilder: (_, index) => CourseItem(widget.list[index]),
        itemCount: widget.list?.length ?? 0);
  }

  @override
  bool get wantKeepAlive => true;
}
