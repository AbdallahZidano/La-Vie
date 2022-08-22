import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/home.dart';
import 'package:test/controller/search.dart';

import 'package:test/data/models/products.dart';
import 'package:test/helper/constants/colors.dart';

class SearchCard extends StatefulWidget {
  Data? item;

  SearchCard({required this.item});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final HomeController _homeController = Get.find();
  final SearchConteroller _searchConteroller = Get.find();
  final ColorHepler _colorHepler = ColorHepler();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 228, 228, 228),
            offset: Offset(2, 3),
            blurRadius: 5,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            width: 120,
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://lavie.orangedigitalcenteregypt.com' +
                      widget.item!.imageUrl,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: Text(
                  widget.item!.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.item!.price} EGP",
                style: TextStyle(
                  color: _colorHepler.brand,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _homeController.addToCartWithId(
                      context, widget.item!.productId);
                  _searchConteroller
                      .reomveFromListToShow(widget.item!.productId);
                },
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colorHepler.brand,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
