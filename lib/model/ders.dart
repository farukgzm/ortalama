class Ders{
  final String ad;
  final double herfDegeri;
  final double krediDegeri;

  Ders({required this.ad, required this.herfDegeri,required this.krediDegeri});
  @override
  String toString() {
    // TODO: implement toString
    return '$ad,$herfDegeri$krediDegeri';
  }

}