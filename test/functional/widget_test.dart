import 'dart:async';

// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starter/book_dto.dart';
import 'package:starter/book_repository.dart';

import 'package:starter/main.dart';


class MockRepository extends Mock implements BookRepository {}

void main() {

  @Skip
  testWidgets('Loading contents test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var mockedBookRepository = new MockRepository();
    Completer<BookDTO> completer = new Completer();
    when(mockedBookRepository.getBooks(typed(argThat(anything)))).thenAnswer((
        _) => completer.future);

    await tester.pumpWidget(new MyApp(key: null, repository:
    mockedBookRepository));

    verify(mockedBookRepository.getBooks(0));
  });
}
