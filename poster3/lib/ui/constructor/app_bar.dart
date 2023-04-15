import 'package:flutter/material.dart';

import 'package:poster3/poster_const.dart';

class ConstructorAppBar extends AppBar {
  ConstructorAppBar({super.key}): super(
    title: const Text(posterTitle),
    actions: [
      Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Stack(
            children: [
              Container(
                decoration: const ShapeDecoration(
                  //border: CircleBorder(),
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: glowColor,
                      spreadRadius: 4,
                      blurRadius: 8,
                    )
                  ],
                  color: glowColor,
                  //borderRadius: BorderRadius.all(Radius.circular(4)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: glowColor,
                  //     spreadRadius: 0,
                  //     blurRadius: 2,
                  //   ),
                  //   // BoxShadow(
                  //   //   color: Colors.red,
                  //   //   spreadRadius: -2,
                  //   //   blurRadius: 8,
                  //   // )
                  // ]
                ),
                child: const Text('4'),
              ),
              IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.smart_toy_outlined)
              ),
            ]
          )
        )
      ),
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