import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:trips/config/styles/dimens.dart';
import 'package:trips/config/styles/text_styles.dart';
import 'package:trips/config/theme/app_colors.dart';
import 'package:trips/features/trips/models/trip_model.dart';

class TripWidget extends StatelessWidget {
  final TripModel trip;
  const TripWidget({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: Dimens.xsmallMargin,
        horizontal: Dimens.midMargin,
      ),
      padding: const EdgeInsets.all(Dimens.smallMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.midBorder,
        ),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
            color: Color.fromARGB(255, 207, 203, 203),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 26,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.smallMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.routeNum,
                        style: TextStyles.title2,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        trip.bus,
                        style: TextStyles.subtitle2,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '• ${trip.price}',
                        style: TextStyles.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_add_outlined,
                  ),
                ),
              ),
            ],
          ),
          buildItem(
            title: trip.departureName,
            subtitle: trip.departureTime,
            address: trip.departurePlace,
            isEnd: false,
          ),
          buildItem(
            title: trip.arrivalName,
            subtitle: trip.arrivalTime,
            address: trip.arrivalPlace,
            isEnd: true,
          ),
        ],
      ),
    );
  }

  buildItem({
    required String title,
    required String subtitle,
    String? address,
    required bool isEnd,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.adjust,
                  color: AppColors.grey,
                ),
              ),
              if (!isEnd)
                const DottedLine(
                  direction: Axis.vertical,
                  lineThickness: 2,
                  lineLength: 50,
                  dashLength: 8,
                  dashGapLength: 6,
                  dashColor: AppColors.grey,
                ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.title2Italic,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          subtitle,
                          style: TextStyles.subtitle2,
                        ),
                      ),
                      if (address != null)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              '• $address',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.subtitle2,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


    // Stepper(
          //   physics: const NeverScrollableScrollPhysics(),
          //   connectorColor: MaterialStateProperty.all(AppColors.primaryGreen),
          //   steps: [
          //     Step(
          //       title: Text(
          //         trip.departureName,
          //         style: TextStyles.title2,
          //       ),
          //       content: Row(
          //         children: [
          //           Expanded(
          //             child: Text(
          //               trip.departurePlace,
          //               style: TextStyles.subtitle2,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Step(
          //       title: Text(
          //         trip.arrivalName,
          //         style: TextStyles.title2,
          //       ),
          //       content: Row(
          //         children: [
          //           Expanded(
          //             child: Text(
          //               trip.arrivalPlace,
          //               style: TextStyles.subtitle2,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),