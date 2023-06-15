import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';

class OrtamaGoster extends StatelessWidget {
  final double ortalama;
  final int derSayisi;
  const OrtamaGoster({super.key, required this.ortalama, required this.derSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text(
        derSayisi>0 ?'$derSayisi Ders girildi':'Ders Seciniz',
        style: sabitler.dersSayisiStyle,
      ),
      Text(ortalama>=0?'${ortalama.toStringAsFixed(2)}':'0.0',style: sabitler.ortamaStyle,),
      Text('ortalama',style: sabitler.dersSayisiStyle,),
    ],);
  }
}