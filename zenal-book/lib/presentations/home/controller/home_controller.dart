import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zenal/domain/model/book.dart';
import 'package:zenal/domain/repository/book_repository.dart';

import '../../component/component.dart';

class RedeemController extends GetxController with StateMixin {
  final List<Book> books = [];
  final List<Book> booksFrance = [];
  final List<Book> booksChildren = [];
  final BookRepository bookRepository = BookRepository();

  @override
  void onInit() {
    getDataBook();
    super.onInit();
  }

  Future getDataBook() async {
    change(null, status: RxStatus.success());
    await bookRepository.getBooks().then((value) {
      books.addAll(value);
      update();
    });
    await bookRepository.getBooksFrance().then((value) {
      booksFrance.addAll(value);
      update();
    });
    await bookRepository.getBooksChildern().then((value) {
      booksChildren.addAll(value);
      update();
    });
  }

  onClickDetail(Book book) {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.formats?.imageJpeg ?? "",
                fit: BoxFit.contain,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) => Center(child: const Icon(Icons.broken_image)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Component.textBold(
                  book.title ?? "",
                  fontSize: 14,
                  colors: ColorPalette.blackText,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Component.textDefault(
                      "Authors: ",
                      fontSize: 12,
                      colors: ColorPalette.blackText,
                    ),
                    Component.textBold(
                      book.authors?.first.name ?? "",
                      fontSize: 12,
                      colors: ColorPalette.blackText,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Component.textDefault(
                      "Genre: ",
                      fontSize: 12,
                      colors: ColorPalette.blackText,
                    ),
                    // Flexible(
                    //   child: Component.textBold(
                    //     book.subjects?.map((e) => e).join() ?? "",
                    //     fontSize: 12,
                    //     colors: ColorPalette.blackText,
                    //     maxLines: 4,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Component.textDefault(
                      "Language: ",
                      fontSize: 12,
                      colors: ColorPalette.blackText,
                    ),
                    // Component.textBold(
                    //   book.languages?.map((e) => e).join() ?? "",
                    //   fontSize: 12,
                    //   colors: ColorPalette.blackText,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () => Get.back(), child: Component.textBold("Close")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      backgroundColor: ColorPalette.white,
      ignoreSafeArea: false,
      clipBehavior: Clip.hardEdge,
    );
  }
}
