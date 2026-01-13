// import 'package:flutter/material.dart';
// import 'package:typeelevenkiosk/common/const/size.dart';
// import 'package:typeelevenkiosk/common/extention/figma.dart';
//
// class SecondComponent extends StatefulWidget {
//   const SecondComponent({super.key});
//
//   @override
//   State<SecondComponent> createState() => _SecondComponentState();
// }
//
// class _SecondComponentState extends State<SecondComponent> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: CocorySize.width(2025),
//       height: CocorySize.height(370),
//       padding: EdgeInsets.only(
//           left: CocorySize.width(104),
//           top: CocorySize.height(56),
//           right: CocorySize.width(83.48)),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(CocorySize.width(65))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Price\n& Duration',
//                 style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.w700,
//                     fontSize: CocorySize.width(70),
//                     height: CocorySize.width(80)
//                         .toFigmaHeight(CocorySize.width(70))),
//               ),
//               SizedBox(height: CocorySize.height(15)),
//               Text(
//                 '金额（韩元）& 所需时间',
//                 style: TextStyle(
//                     fontSize: CocorySize.width(45),
//                     height: CocorySize.width(94)
//                         .toFigmaHeight(CocorySize.width(45))),
//               )
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: CocorySize.height(55)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: CocorySize.width(820),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '1 person',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: CocorySize.width(45)),
//                       ),
//                       Text(
//                         '•',
//                         style: TextStyle(
//                             fontSize: CocorySize.width(45)),),
//                         Text('130,000   (60 mins)',
//                             style: TextStyle(
//                                 fontSize: CocorySize.width(45))),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: CocorySize.width(820),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '2 people',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: CocorySize.width(45)),
//                       ),
//                       Text(
//                         '•',
//                         style: TextStyle(
//                             fontSize: CocorySize.width(45)),),
//                         Text('240,000   (90 mins)',
//                             style: TextStyle(
//                                 fontSize: CocorySize.width(45))),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: CocorySize.width(820),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '3 people',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: CocorySize.width(45)),
//                       ),
//                       Text(
//                         '•',
//                         style: TextStyle(
//                             fontSize: CocorySize.width(45)),),
//                         Text('360,000 (120 mins)',
//                             style: TextStyle(
//                                 fontSize: CocorySize.width(45))),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
