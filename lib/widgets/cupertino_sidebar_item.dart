import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_widgets/widgets/cupertino_navigation_split_view_state.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final String trailing;
  final String subtitle;
  final IconData? icon;

  const SidebarItem({
    required this.title,
    this.subtitle = "",
    this.trailing = "",
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sidebarState = CupertinoNavigationSplitViewState.of(context);
    var isSelected = sidebarState.selectedItem == title;

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? sidebarState.color : CupertinoColors.white.withAlpha(0),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: subtitle.isEmpty ? 10.0 : 4.0),
            child: Row(
              children: [
                if (icon != null) ...{
                  Icon(
                    icon,
                    color: isSelected ? CupertinoColors.white : sidebarState.color,
                  ),
                },
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: isSelected ? CupertinoColors.white : CupertinoColors.black),
                      ),
                      if (subtitle.isNotEmpty) ...{
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: isSelected ? CupertinoColors.white : CupertinoColors.systemGrey,
                            fontSize: 12,
                          ),
                        ),
                      }
                    ],
                  ),
                ),
                Text(
                  trailing,
                  style: TextStyle(
                    color: isSelected ? CupertinoColors.white : CupertinoColors.systemGrey,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        sidebarState.updateSelectedItem(title);
      },
    );
  }
}
