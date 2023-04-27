import 'package:flutter/material.dart';

import '../../const.dart';
import '../../models/projects.dart';


class ProjectCard extends StatelessWidget {
   ProjectCard({
    super.key,
    required this.project,
  });
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kSecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            project.image!,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: Text(
              project.description!,
              style: TextStyle(height: 1.5),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          TextButton(
              onPressed: () => {},
              child: Text(
                'More Info >',
                style: TextStyle(color: kPrimaryColor),
              ))
        ],
      ),
    );
  }
}
