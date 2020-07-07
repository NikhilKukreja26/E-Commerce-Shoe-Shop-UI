import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/const.dart';
import '../models/shoe_model.dart';
import '../widgets/app_clipper.dart';

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;

  const DetailPage({
    Key key,
    this.shoeModel,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        title: Text('CATEGORIES'),
        backgroundColor: widget.shoeModel.color,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 50.0,
                    diagonalHeight: 180.0,
                    roundedBottom: false,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 300.0,
                          child: Text(
                            widget.shoeModel.name,
                            style: TextStyle(
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        _buildRating(),
                        const SizedBox(height: 10.0),
                        Text(
                          'Details'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          widget.shoeModel.desc,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Color Options'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            _buildColorOptions(AppColors.blueColor),
                            _buildColorOptions(AppColors.greenColor),
                            _buildColorOptions(AppColors.redColor),
                            _buildColorOptions(AppColors.orangeColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Hero(
                tag: "hero${widget.shoeModel.imgPath}",
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image(
                    width: MediaQuery.of(context).size.width * .85,
                    height: MediaQuery.of(context).size.width * .38,
                    image: AssetImage("${widget.shoeModel.imgPath}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Price'.toUpperCase(),
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                '\$${widget.shoeModel.price.toInt()}',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 50,
            ),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Text(
              "ADD CART",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOptions(Color color) {
    return Container(
      width: 20.0,
      height: 20.0,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[
        RatingBar(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        const SizedBox(width: 16.0),
        Text(
          '134 Reviews',
          style: TextStyle(
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}
