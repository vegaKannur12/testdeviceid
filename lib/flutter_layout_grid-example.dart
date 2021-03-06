// import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter/material.dart';

// class ItemCardLayoutGrid extends StatelessWidget {
//   const ItemCardLayoutGrid({
//     Key? key,
//     required this.crossAxisCount,
//     required this.items,
//   })  
//   // we only plan to use this with 1 or 2 columns
//   : assert(crossAxisCount == 1 || crossAxisCount == 2),
//     // assume we pass an list of 4 items for simplicity
//     assert(items.length == 4),
//     super(key: key);
//   final int crossAxisCount;
//   final List<ItemCardData> items;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutGrid(
//       // set some flexible track sizes based on the crossAxisCount
//       columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
//       // set all the row sizes to auto (self-sizing height)
//       rowSizes: crossAxisCount == 2
//           ? const [auto, auto]
//           : const [auto, auto, auto, auto],
//       rowGap: 40, // equivalent to mainAxisSpacing
//       columnGap: 24, // equivalent to crossAxisSpacing
//       // note: there's no childAspectRatio
//       children: [
//         // render all the cards with *automatic child placement*
//         for (var i = 0; i < items.length; i++)
//           ItemCard(data: items[i]),
//       ],
//     );
//   }

//   Widget ItemCard(){
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             child: Image.asset(""),
//           ),
//           Container(),
//           Container()
//         ],
//       ),
//     );
//   }
// }



// ///////////////////////////////////////
// class ItemCardData{
//   String? img;
//   String? title;
//   String? desc;
//   ItemCardData({this.img,this.title,this.desc});
// }