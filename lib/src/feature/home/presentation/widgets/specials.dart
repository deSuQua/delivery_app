import 'package:delivery_app/src/core/extenstion/extenstions.dart';
import 'package:delivery_app/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

@immutable
class Specials extends StatelessWidget {
  const Specials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Special for you',
                      style: context.theme.textTheme.bodyMedium14.copyWith(
                        color: context.theme.colors.secondary,
                      ),
                    ),
                  ),
                  Assets.icons.arrowRightSquared.svg(
                    width: 14,
                    height: 14,
                    colorFilter: ColorFilter.mode(
                      context.theme.colors.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) =>
                    const _Special(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 12),
              ),
            ),
          ],
        ),
      );
}

@immutable
class _Special extends StatelessWidget {
  const _Special({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.colors.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 166,
          height: 64,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://vixvox.ru/userfiles/images/articles/raspr23-2.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
