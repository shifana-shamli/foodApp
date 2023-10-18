import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/utils/app_constant.dart';
import 'package:shimmer/shimmer.dart';

Widget homeShimmer(context) {
    return Scaffold(
      body: GridView.builder(
        padding: commonPaddingAll,
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 10, // spacing between rows
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 3.5),
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Card(
              margin: commonPaddingAll,
              elevation: 1,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                    width: 250,

                  ),

                ],
              ),
            ),
          );
        },
      )
    );
  }

