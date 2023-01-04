import 'package:flutter/material.dart';

import 'package:poster3/poster_const.dart' show posterTitle;

class ConstructorAppBar extends AppBar {
  ConstructorAppBar({super.key}): super(
    title: const Text(posterTitle),
    actions: [
      Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Stack(
            children: [
              IconButton(                
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.smart_toy_outlined)
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  // color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      spreadRadius: 0,
                      blurRadius: 8,
                    ),
                    // BoxShadow(
                    //   color: Colors.red,
                    //   spreadRadius: -2,
                    //   blurRadius: 8,
                    // )
                  ]
                ),
                child: const Text('2'),
              )
            ]
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