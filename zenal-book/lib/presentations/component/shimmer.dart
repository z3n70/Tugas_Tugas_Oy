import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zenal/core/app/color_palette.dart';
import '../../core/app/constant.dart';

class ShimmerWidget {
  static Widget shimmerGrid() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: ColorPalette.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: ColorPalette.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  static shimmerHorizontal() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: Constant.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: ColorPalette.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: ColorPalette.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
