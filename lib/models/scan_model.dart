import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        this.autor,
        this.tipo,
        required this.valor,
    }) {
      if (valor.contains('http')) {
        tipo = 'http';
      } else {
        tipo = 'geo';
      }
    }

    int? autor;
    String? tipo;
    String valor;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        autor: json["autor"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "autor": autor,
        "tipo": tipo,
        "valor": valor,
    };
}
