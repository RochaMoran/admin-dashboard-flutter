import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Main'),
          MenuItem(
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Analytics',
              icon: Icons.analytics_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Categories',
              icon: Icons.category_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Products',
              icon: Icons.add_box_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Customers',
              icon: Icons.person_3_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.settings_input_component_sharp,
            isActive: false,
            onPressed: () => {}
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.email_outlined,
            isActive: false,
            onPressed: () => {}
          ),
          MenuItem(
              text: 'Campaign',
              icon: Icons.campaign_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Black',
              icon: Icons.post_add_outlined,
              isActive: false,
              onPressed: () => {}
          ),
          MenuItem(
              text: 'Logout',
              icon: Icons.logout_outlined,
              isActive: false,
              onPressed: () => {}
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092042),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
