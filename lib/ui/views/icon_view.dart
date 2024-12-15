import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text("Icons", style: CustomLabels.h1),
        const SizedBox(height: 10),

        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.ac_unit_outlined
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.access_alarm_outlined
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.precision_manufacturing
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.dark_mode_outlined
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.offline_bolt
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.safety_check
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.ac_unit_outlined
                ),
            )),
            WhiteCard(
              width: 120,
              child: Center(
                child: Icon(
                  Icons.radar_sharp
                ),
            )),
          ],
        )
      ],
    );
  }
}