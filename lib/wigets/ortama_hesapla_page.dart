import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constants.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';
import 'package:ortalama_hesaplama/model/ders.dart';
import 'package:ortalama_hesaplama/wigets/ders_listesi.dart';
import 'package:ortalama_hesaplama/wigets/ortama_goster.dart';



class OrtamaHesaplaApp extends StatefulWidget {
  
  const OrtamaHesaplaApp({super.key});

  @override
  State<OrtamaHesaplaApp> createState() => _OrtamaHesaplaAppState();
}

class _OrtamaHesaplaAppState extends State<OrtamaHesaplaApp> {
  var formKey=GlobalKey<FormState>();
 double secilenHarfDegeri=4;
 double secilenkrediDegeri=1;
 String girilenDersAdi='';

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(sabitler.baslikText,style: sabitler.baslikStyle),),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch ,
        children: [
          Row(
            children: [
               Expanded(
          flex: 2,
          child: _buildForm(),
        ), Expanded(
          flex: 1,
          child: OrtamaGoster(ortalama:DataHelper.ortamaHesapla(), derSayisi:DataHelper.tumEklenendersler.length,),
        ),
            ],
           ),
        Expanded(
          flex: 1,
          child: dersListesi(onElemanCikarildi: (index){
            DataHelper.tumEklenendersler.removeAt(index);
            setState(() {
              
            });
            
          },),
        ),
       
      ],),
    );
  }
  
  _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        _buildTextFormField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: _buildHarfler(),)),
          
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: _buildKrediler(),)),
            IconButton(onPressed: _dersEkleveOrtalamaHesepla, 
            icon: Icon(Icons.arrow_forward_ios_sharp),),
          ],
        ),
      ],),
    );
  }
  
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi=deger!;
        });
      },
      validator: (s) {
        if(s!.length <=0){
          return 'Ders adı giriniz';
        }else
        return null;
      },

      decoration: InputDecoration(
        hintText: 'matematik',
        border: OutlineInputBorder(
          borderRadius: sabitler.borderRadius,
          
        ),
        filled: true,
        fillColor: sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
  
  _buildHarfler() {
    
    
    return Container(
      padding: sabitler.dropDownPadding,

      decoration: BoxDecoration(
        color: sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: sabitler.borderRadius),
        child: DropdownButton<double>(
          value: secilenHarfDegeri,
          elevation: 16,
          iconEnabledColor: sabitler.anaRenk.shade200,
          onChanged: (deger) {
            setState(() {
              secilenHarfDegeri=deger!;
            });
          },
          items: DataHelper.tumderslerinHarleri(),
          
          
          ),
        
    );
  }
  _buildKrediler() {
    
    
    return Container(
      padding: sabitler.dropDownPadding,

      decoration: BoxDecoration(
        color: sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: sabitler.borderRadius),
        child: DropdownButton<double>(
          value: secilenkrediDegeri,
          elevation: 16,
          iconEnabledColor: sabitler.anaRenk.shade200,
          onChanged: (deger) {
            setState(() {
              secilenkrediDegeri=deger!;
            });
          },
          items: DataHelper.tumDerslerinKredileri(),
          
          
          ),
        
    );
  }

  void _dersEkleveOrtalamaHesepla() {

    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers=Ders(ad: girilenDersAdi, herfDegeri: secilenHarfDegeri, krediDegeri: secilenkrediDegeri);
    DataHelper.dersEkle(eklenecekDers);
    setState(() {
      
    });
    }
  }
}