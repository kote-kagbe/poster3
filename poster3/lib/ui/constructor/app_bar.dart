import 'package:flutter/material.dart';

import 'package:poster3/poster_const.dart';
import 'package:poster3/ui/constructor/macros_list_button.dart';

class ConstructorAppBar extends AppBar {
  ConstructorAppBar({super.key}): super(
    title: const Text(posterTitle),
    actions: [
      const MacrosListButton(),
      Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.only(right: 2, top: 2),
          child: IconButton(                
            onPressed: () => {},
            icon: const Icon(Icons.playlist_add_check_rounded)
          )
        )
      )
    ],
  );
}

// class ConstructorAppBar extends StatelessWidget implements PreferredSizeWidget {
//   // const ConstructorAppBar({super.key}): super();

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text(posterTitle),
//       actions: [
//         Builder(
//           builder: (context) => IconButton(
//             onPressed: () => Scaffold.of(context).openEndDrawer(),
//             icon: const Icon(Icons.smart_toy_outlined)
//           )
//         )
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }