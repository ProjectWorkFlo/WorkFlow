//still debugging
//import 'package:flutter/material.dart';

class Founder {
  String key;
  String foundry;

  Founder({this.foundry, this.key});

  factory Founder.fromJson(Map<String, dynamic> json) {
    return Founder(
      foundry: json["foundry"],
    );
  }

  toJson() {
    return {
      "foundry": foundry,
    };
  }
}
