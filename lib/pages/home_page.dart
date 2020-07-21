import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

import '../core/flutter_icons.dart';
import '../core/const.dart';
import '../models/shoe_model.dart';
import '../widgets/app_clipper.dart';
import '../pages/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var shoeList2 = shoeList;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ResponsiveRow(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(FlutterIcons.search),
                  color: Colors.black26,
                  onPressed: () {},
                ),
              ],
            ),
          ),

          ResponsiveRow(
            children: [
              Container(
                height: 300.0,
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: shoeList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      // onTap: () {
                      //   Navigator.of(context).pushNamed(
                      //     DetailPage.routeName,
                      //     arguments: shoeList[index].id,
                      //   );
                      // },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        width: 230.0,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: _buildBackGround(index, 230.0),
                            ),
                            Positioned(
                              bottom: 130,
                              right: 10,
                              child: Transform.rotate(
                                angle: -math.pi / 7,
                                child: Container(
                                  width: 220.0,
                                  child: Image.asset(shoeList[index].imgPath),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ResponsiveRow(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Just For You'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All'.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          ResponsiveRow(
            columnsCount: 4,
            children: shoeList2.map(
              (data) {
                return FlexWidget(
                  // Como hijo, usamos una imágen desde internet, será la misma para todas
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.of(context).pushNamed(
                    //     DetailPage.routeName,
                    //     arguments: data.id,
                    //   );
                    // },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 10.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            data.imgPath,
                            width: 100.0,
                            height: 60.0,
                          ),
                          const SizedBox(width: 14.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    '${data.name}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${data.brand}',
                                  style: TextStyle(
                                    color: Colors.black26,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '\$${data.price.toInt()}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Definimos un ancho de 6 para movil, lo que es lo mismo, dos columnas
                  xs: 4,
                  // Definimos un ancho de 3 para tablets pequeñas, 4 columnas
                  sm: 4,
                  // Definimos 2 para tablets, 6 columnas
                  md: 4,
                  // Definimos 1 para pantallas grandes, 12 columnas
                  lg: 4,
                  // Conficiones para horizontal
                  // Definimos 4 para movil en horizontal, 3 columnas
                  xsLand: 4,
                  // Definimos 2 para tablets pequeñas, 6 columnas
                  smLand: 4,
                  // Definimos 2 para tablets, 6 columnas
                  mdLand: 4,
                  // Definimos 1 para patallas grandes, 12 columnas
                  lgLand: 4,
                );
              },
            ).toList(),
          ),
          // ...shoeList2.map(
          //   (data) => GestureDetector(
          // onTap: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DetailPage(
          //         shoeModel: data,
          //       ),
          //     ),
          //   );
          // },
          //     child: Container(
          //       margin: const EdgeInsets.only(
          //           left: 16.0, right: 16.0, bottom: 10.0),
          //       padding: const EdgeInsets.symmetric(
          //           vertical: 16.0, horizontal: 24.0),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(25.0),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black12,
          //             blurRadius: 10.0,
          //             spreadRadius: 1.0,
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         children: <Widget>[
          //           Image.asset(
          //             data.imgPath,
          //             width: 100.0,
          //             height: 60.0,
          //           ),
          //           const SizedBox(width: 14.0),
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Container(
          //                   width: MediaQuery.of(context).size.width * 0.4,
          //                   child: Text(
          //                     '${data.name}',
          //                     maxLines: 1,
          //                     overflow: TextOverflow.ellipsis,
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //                 Text(
          //                   '${data.brand}',
          //                   style: TextStyle(
          //                     color: Colors.black26,
          //                     height: 1.5,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //             child: Text(
          //               '\$${data.price.toInt()}',
          //               style: TextStyle(
          //                 fontSize: 18.0,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1.0,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FlutterIcons.compass),
              ),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.list),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.bag),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.person_outline),
              title: Text('data'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackGround(int index, double width) {
    return ClipPath(
      clipper: AppClipper(
        cornerSize: 25.0,
        diagonalHeight: 180.0,
      ),
      child: Container(
        width: width,
        color: shoeList[index].color,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Icon(
                      shoeList[index].brand == 'Nike'
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 125.0,
                    child: Text(
                      '${shoeList[index].name}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '\$${shoeList[index].price.toInt()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    FlutterIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
