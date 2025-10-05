class PengembangEntity {
  final String image;
  final String name;
  final String id;
  final String idType;

  PengembangEntity({
    required this.image,
    required this.name,
    required this.id,
    required this.idType,
  });
}

List<PengembangEntity> pengembangList = [
  PengembangEntity(
    image: 'susiswo',
    name: 'Dr. Susiswo, M. Si.',
    id: '0028036505',
    idType: 'NIDN',
  ),
  PengembangEntity(
    image: 'anita',
    name: 'Dr. Anita Dewi Utami, M.Pd.',
    id: '0028059008',
    idType: 'NIDN',
  ),
  PengembangEntity(
    image: 'ramdhan',
    name: 'Ramdhan Fazrianto S., M.Si.',
    id: '0403058902',
    idType: 'NIDN',
  ),
  PengembangEntity(
    image: 'cakra',
    name: 'Annafi Awantagusnik',
    id: '230311906856',
    idType: 'NIM',
  ),
  PengembangEntity(
    image: 'cakra',
    name: 'Dewi Isarotur Rohmah',
    id: '230311817263',
    idType: 'NIM',
  ),
];
