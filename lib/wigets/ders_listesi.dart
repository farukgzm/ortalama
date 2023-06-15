import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';
import 'package:ortalama_hesaplama/model/ders.dart';

class dersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const dersListesi({required this.onElemanCikarildi,Key? key}):super(key: key) ;

  @override
  Widget build(BuildContext context) {
    List <Ders> tumDersler=DataHelper.tumEklenendersler;
    return tumDersler.length>0? ListView.builder(itemCount: tumDersler.length, itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (a) {
          onElemanCikarildi(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(backgroundColor: sabitler.anaRenk,
              child: Text((tumDersler[index].herfDegeri*tumDersler[index].krediDegeri).toStringAsFixed(0)),),
              subtitle: Text('${tumDersler[index].krediDegeri}Kredi ,Not Değeri ${tumDersler[index].herfDegeri}'),
            ) ,
          ),
        ),
      );

    }
    ):Container(
      child: Center(child: Text('Ders Giriniz',style: sabitler.baslikStyle,),)
    );
  }
}