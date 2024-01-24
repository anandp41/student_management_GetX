import 'dart:convert';

import 'package:flutter/material.dart';

ImageProvider imageProcessor(image) {
  final ImageProvider newImage;
  newImage = (image != 'empty'
      ? MemoryImage(const Base64Decoder().convert(image!))
      : const AssetImage('assets/images/def.png')) as ImageProvider;
  return newImage;
}
