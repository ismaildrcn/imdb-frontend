import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final GoRouterState state;
  const CustomBottomNavigationBar({super.key, required this.state});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final String location = widget.state.uri.toString();
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          navigationItem(
            context,
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: "Home",
            isActive: location == '/',
            onTap: () => GoRouter.of(context).go('/'),
          ),
          navigationItem(
            context,
            icon: Icons.analytics_outlined,
            activeIcon: Icons.analytics_rounded,
            label: "Browser",
            isActive: location == '/browser',
            onTap: () => GoRouter.of(context).go('/browser'),
          ),
          navigationItem(
            context,
            icon: Icons.play_arrow_outlined,
            activeIcon: Icons.play_arrow_rounded,
            label: "Discover",
            isActive: location == '/discover',
            onTap: () => GoRouter.of(context).go('/discover'),
          ),
          navigationItem(
            context,
            icon: Icons.search,
            activeIcon: Icons.search_rounded,
            label: "Profile",
            isActive: location == '/profile',
            onTap: () => GoRouter.of(context).go('/profile'),
          ),
        ],
      ),
    );
  }

  Widget navigationItem(
    context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: isActive
              ? Row(
                  spacing: 10,
                  children: [
                    Icon(
                      activeIcon,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                )
              : Row(children: [Icon(icon, size: 24, color: Colors.grey[500])]),
        ),
      ),
    );
  }
}
