import 'package:flutter/material.dart';
import 'package:life_skills_app/models/new_model.dart';
import 'package:life_skills_app/resources/app_color.dart';

class NewItem extends StatelessWidget {
  final NewModel data;

  NewItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            data.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontSize: 14, color: AppColor.h5E5E5E),
          ),
        )
      ],
    );
  }
}
