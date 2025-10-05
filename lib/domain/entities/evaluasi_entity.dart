class EvaluasiEntity {
  final String answer;
  final String question;
  final String explanation;
  final String code;
  final String afterImageQuestion;
  final String image;
  final List<String> answerList;
  final bool? isImage;
  final bool? isEssay;

  EvaluasiEntity({
    required this.question,
    this.afterImageQuestion = '',
    this.image = '',
    this.explanation = '',
    this.code = '',
    this.answer = 'A',
    required this.answerList,
    this.isImage = false,
    this.isEssay = false,
  });
}

List<EvaluasiEntity> evaluasiKubusList = [
  EvaluasiEntity(
    question:
        'Toko "Kotak Kado Ceria" menyediakan kotak berbentuk kubus untuk membungkus hadiah. Kotak-kotak tersebut memiliki panjang rusuk berbeda, yaitu 10 cm, 12 cm, dan 15 cm. Jika biaya produksi kotak bergantung pada volume, maka urutan dari kotak yang paling hemat hingga yang paling mahal untuk diproduksi adalah…',
    answerList: [
      '15 cm, 12 cm, 10 cm',
      '12 cm, 15 cm, 10 cm',
      '12 cm, 10 cm, 15 cm',
      '10 cm, 15 cm, 12 cm',
      '10 cm, 12 cm, 15 cm',
    ],
    answer: 'E',
  ),
  EvaluasiEntity(
    question:
        'Seorang siswa menemukan bahwa volume sebuah kubus adalah 729 cm³. Namun saat mengukur panjang sisi-sisi kubus dengan penggaris, ia mendapatkan hasil 8,5 cm. Ia merasa ragu apakah pengukuran atau perhitungannya yang keliru. Analisis apakah hasil pengukuran tersebut sesuai dengan volume kubus?',
    answerList: [
      'Benar, karena perhitungan sesuai',
      'Tidak, karena perhitungan tidak sesuai',
    ],
    answer: 'A',
  ),
  EvaluasiEntity(
    question:
        'Rancangan bangun kubus yang terdiri dari kubus satuan 1 cm yang mempunyai volume 4.096 cm . Berapa tinggi bangun kubus tersebut?',
    answerList: ['12 cm', '13 cm', '14 cm', '15 cm', '16 cm'],
    answer: 'E',
  ),
];

List<EvaluasiEntity> evaluasiBalokList = [
  EvaluasiEntity(
    isImage: true,
    image: 'assets/balok_evaluasi_1.png',
    question: 'Bu Ratna akan membuat cetakan kue seperti gambar berikut.',
    afterImageQuestion:
        'Jika cetakan kue Bu Ratna berbentuk balok dengan panjang dan lebar yang sama, maka berapa ml volume adonan kue yang diperlukan Bu Ratna untuk membuat kue sesuai cetakan?',
    answerList: ['600 ml', '2.048 ml', '5.760 ml', '7.808 ml', '8.408 ml'],
    answer: 'E',
  ),
  EvaluasiEntity(
    isImage: true,
    image: 'assets/balok_evaluasi_2.png',
    question:
        'Di gudang Pak Joko terdapat 2 tempat penyimpanan yang berbeda ukurannya seperti gambar berikut.',
    afterImageQuestion:
        'Jika Pak Joko membutuhkan tempat untuk menyimpan banyak barangnya, maka kotak mana yang akan dipilih Pak Joko agar muat lebih banyak barang? dan berapa volumenya?',
    answerList: [
      'Kotak A, \nvolumenya 50.000 cm³',
      'Kotak B, \nvolumenya 82.500 cm³',
      'Kotak A, \nvolumenya 82.500 cm³',
      'Kotak B, \nvolumenya 50.000 cm³',
    ],
    answer: 'C',
  ),
  EvaluasiEntity(
    question:
        'Dari ukuran balok yang dapat dibuat sehingga memenuhi dua syarat berikut:\na. Volumenya berkisar antara \n     2.000 – 2.500 cm³.\nb.Ukuran dari panjang, lebar dan \n    tingginya tidak kurang dari 10 \n    cm.\nKombinasi ukuran balok yang dapat dibuat adalah...',
    answerList: [
      'Panjang 10 cm, lebar 13 cm, tinggi 20 cm',
      'Panjang 11 cm, lebar 12 cm, tinggi 20 cm',
      'Panjang 12 cm, lebar 10 cm, tinggi 20 cm',
      'Panjang 13 cm, lebar 10 cm, tinggi 20 cm',
      'Panjang 14 cm, lebar 9 cm, tinggi 20 cm',
    ],
    answer: 'C',
  ),
];

List<EvaluasiEntity> evaluasiKubusBalokList = [
  EvaluasiEntity(
    isImage: true,
    image: 'assets/kubus_balok_1.png',
    afterImageQuestion:
        'Volume satu kubus kecil yang ada pada rubik tersebut…. cm³.',
    question:
        'Sebuah rubik berukuran 18 cm x 18 cm terdiri dari kubus-kubus kecil identik yang tersusun seperti pada gambar di bawah ini.',
    answerList: ['5.832 cm³', '1.944 cm³', '729 cm³', '216 cm³', '27 cm³'],
  ),
  EvaluasiEntity(
    isImage: true,
    image: 'assets/kubus_balok_2.png',
    question:
        'Temukan total volume dari dua wadah berikut. Berapa ml lebihnya air yang dapat ditampung Wadah B dibandingkan Wadah A?',
    answerList: [
      'Wadah A dapat menampung 1.440 ml lebih banyak dari Wadah B.',
      'Wadah B dapat menampung 1.560 ml lebih banyak dari Wadah A.',
      'Wadah A dapat menampung 120 ml lebih banyak dari Wadah B.',
      'Wadah B dapat menampung 120 ml lebih banyak dari Wadah A.',
      'Wadah B dapat menampung 120 ml lebih sedikit dari Wadah A.',
    ],
  ),
  EvaluasiEntity(
    question:
        'Pak Dani mempunyai akuarium yang berbentuk kubus dengan panjang rusuknya adalah 30 cm. Akuarium tersebut diisi air sebanyak ⅔ bagian,\nkemudian ditambahkan air sebanyak 3.000 ml. Periksalah, apakah ada air yang tumpah ke luar akuarium? Jelaskan pendapatmu.',
    answerList: [
      'Terdapat air yang tumpah, sebanyak 6.000 ml',
      'Tidak terdapat air yang tumpah, karena masih terdapat ruang belum terisi sebanyak 6.000 ml',
    ],
  ),
  EvaluasiEntity(
    question:
        'Doni mempunyai dua balok, Balok I dan Balok II. Balok I mempunyai panjang 8 cm, lebar 6 cm, dan tinggi 10 cm. Balok II mempunyai panjang 7\ncm, lebar 5 cm, dan tinggi 13 cm. Doni menyatakan Balok II memiliki volume yang lebih besar dari Balok I. Apakah pernyataan Doni tersebut benar? Jelaskan pendapat Anda!',
    answerList: [
      'Benar, volume Balok II lebih besar dari volume Balok I',
      'Salah, volume Balok II lebih kecil dari volume Balok I',
    ],
  ),
  EvaluasiEntity(
    isEssay: true,
    question:
        'Dian ingin membuat akuarium kecil berbentuk kubus dari kaca dengan panjang sisi 40 cm. Ia juga ingin menghias bagian dalamnya dengan model rumah mini berbentuk kubus juga, agar tetap muat dan air bisa bergerak bebas. Buatlah desain ukuran maksimal model rumah mini yang bisa dimasukkan ke dalam akuarium tanpa menempel ke dindingnya!\nJelaskan alasan dan hitung volumenya!',
    answerList: [''],
  ),
  EvaluasiEntity(
    isEssay: true,
    question:
        'Siska ingin membuat rak penyimpanan berbentuk balok dari papan kayu untuk menaruh buku dan alat tulis di kamarnya. Ia memiliki 6 papan kayu berukuran 100 cm × 50 cm. Setiap papan hanya dapat digunakan sebagai salah satu sisi dari balok tersebut.\nRancanglah ukuran rak berbentuk balok (panjang × lebar × tinggi) yang \nmungkin dibuat dari 6 papan tersebut. Jelaskan alasanmu memilih ukuran tersebut?',
    answerList: [''],
  ),
];
