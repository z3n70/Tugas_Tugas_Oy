import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zenal/core/app/constant.dart';
import 'package:zenal/domain/model/book.dart';
import 'package:zenal/domain/model/response_api.dart';

class BookRepository {
  Future<List<Book>> getBooks() async {
    final List<Book> listData = [];
    final response = await http.get(Uri.parse(Constant.baseUrl));

    if (response.statusCode == 200) {
      var data = ResponseApi.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      if (data.results != null) {
        for (var item in data.results!) {
          listData.add(Book.fromJson(item));
        }
      }

      return listData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Book>> getBooksFrance() async {
    final List<Book> listData = [];
    final response = await http.get(Uri.parse(Constant.baseUrl + '?languages=fr'));

    if (response.statusCode == 200) {
      var data = ResponseApi.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      if (data.results != null) {
        for (var item in data.results!) {
          listData.add(Book.fromJson(item));
        }
      }

      return listData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Book>> getBooksChildern() async {
    final List<Book> listData = [];
    final response = await http.get(Uri.parse(Constant.baseUrl + '?topic=children'));

    if (response.statusCode == 200) {
      var data = ResponseApi.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      if (data.results != null) {
        for (var item in data.results!) {
          listData.add(Book.fromJson(item));
        }
      }

      return listData;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
