// To parse this JSON data, do
//
//     final getModel = getModelFromMap(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class GetModel {
  GetModel({
      required this.qrs,
  });

  List<Qr> qrs;

  factory GetModel.fromJson(String str) => GetModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetModel.fromMap(Map<String, dynamic> json) => GetModel(
      qrs: List<Qr>.from(json["qrs"].map((x) => Qr.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
      "qrs": List<dynamic>.from(qrs.map((x) => x.toMap())),
  };
}

class Qr {
    Qr({
      required this.id,
      required this.tipo,
      required this.valor,
      required this.autor,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
    });

    String id;
    String tipo;
    String valor;
    String autor;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    LatLng getLatLng(String datos) {

      final latLng  = valor.substring(4).split(',');
      final lat     = double.parse( latLng[0] );
      final lng     = double.parse( latLng[1] );

      return LatLng( lat, lng );
    }

    factory Qr.fromJson(String str) => Qr.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Qr.fromMap(Map<String, dynamic> json) => Qr(
      id: json["_id"],
      tipo: json["tipo"],
      valor: json["valor"],
      autor: json["autor"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
      "_id": id,
      "tipo": tipo,
      "valor": valor,
      "autor": autor,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "__v": v,
    };
}
