import 'dart:io';

String fixture(String folderName, String fileName) =>
    File('test/fixtures/$folderName/$fileName').readAsStringSync();
