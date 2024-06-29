import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenal/presentations/component/shimmer.dart';
import 'package:zenal/presentations/home/controller/home_controller.dart';

import '../../component/component.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemController>(
      init: RedeemController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: ColorPalette.white,
            elevation: 0,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.book,
                  color: ColorPalette.primary,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Component.textBold("Zenal Books", colors: ColorPalette.primary),
              ],
            ),
          ),
          backgroundColor: ColorPalette.white,
          body: controller.obx(
            (state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Component.textBold(
                        "Children Book",
                        colors: ColorPalette.primary,
                        fontSize: 17,
                      ),
                      Container(
                        height: 250,
                        child: controller.booksChildren.isEmpty
                            ? ShimmerWidget.shimmerHorizontal()
                            : GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: controller.booksChildren.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => controller.onClickDetail(controller.booksChildren[index]),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              controller.booksChildren[index].formats?.imageJpeg ?? "",
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                              height: double.infinity,
                                              errorBuilder: (context, error, stackTrace) => Center(child: const Icon(Icons.broken_image)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Component.textBold(
                                            controller.booksChildren[index].title ?? "",
                                            fontSize: 12,
                                            colors: ColorPalette.blackText,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      Component.textBold(
                        "France Book",
                        colors: ColorPalette.primary,
                        fontSize: 17,
                      ),
                      Container(
                        height: 250,
                        child: controller.booksFrance.isEmpty
                            ? ShimmerWidget.shimmerHorizontal()
                            : GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: controller.booksFrance.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => controller.onClickDetail(controller.booksFrance[index]),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              controller.booksFrance[index].formats?.imageJpeg ?? "",
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                              height: double.infinity,
                                              errorBuilder: (context, error, stackTrace) => Center(child: const Icon(Icons.broken_image)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Component.textBold(
                                            controller.booksFrance[index].title ?? "",
                                            fontSize: 12,
                                            colors: ColorPalette.blackText,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      Component.textBold(
                        "Popular",
                        colors: ColorPalette.primary,
                        fontSize: 17,
                      ),
                      Flexible(
                        child: controller.books.isEmpty
                            ? ShimmerWidget.shimmerGrid()
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: controller.books.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => controller.onClickDetail(controller.books[index]),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              controller.books[index].formats?.imageJpeg ?? "",
                                              fit: BoxFit.contain,
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
                                          child: Component.textBold(
                                            controller.books[index].title ?? "",
                                            fontSize: 12,
                                            colors: ColorPalette.blackText,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
