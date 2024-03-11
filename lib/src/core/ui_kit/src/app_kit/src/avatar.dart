import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:flutter/material.dart';

@immutable
class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.theme.colors.gray1,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipOval(
            child: SizedBox.square(
              dimension: 60,
              child: Image.network(
                'https://www.unitedagents.co.uk/sites/default/files/thumbnails/image/guybolton-photo-deadline.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
