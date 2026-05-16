import 'package:gpk_app/features/faculty/models/faculty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faculty_providers.g.dart';

@riverpod
List<Faculty> allFaculty(Ref ref) {
  return [
    Faculty("Keneingunuo Kire", "M.Sc(Math)", "7640830169", 'keneikoza13@gmail.com', 'GPK'),
    Faculty("Zhalhourienuo", "B.E(Mechanical)", "8415994972", 'arenokuotsu9@gmail.com', 'GPK'),
    Faculty("Mhiesino Sofia Naleo", "MA with NET JRF", "7005427887", 'naleosofia@gmail.com', 'GPK'),
    Faculty("Katijungla", "MA", "9402830911", 'katyimchenpaul@gmail.com', 'GPK'),
    Faculty("Neisahole Phinyo", "Post Graduate", "9615182117", 'neisahole@gmail.com', 'GPK'),
    Faculty("Aoienla", "M.Tech", "8974522285", 'aien123@gmail.com', 'GPK'),
    Faculty("Kerehienuo Keditsu", "M.Sc(Fashion)", "9402489781", 'kerehienuo@gmail.com', 'GPK'),
    Faculty("A. Chubamenla", "M.Sc(Ftech & Design)", "8732813548", 'chubamenj@gmail.com', 'GPK'),
    Faculty("Modovina Mocha", "M.Sc(Fashion)", "8413958658", 'modovinamocha123@gmail.com', 'GPK'),
    Faculty("Mary Puro", "M.Sc(Ftech)", "9863127985", 'marypuro@yaho.com', 'GPK'),
    Faculty("Sano Yoho", "BA", "9856848293", 'sanoyswu@gmail.com', 'GPK'),
    Faculty("Medozonuo Ruth Kelio", "M.Tech(Civil)", "9863930618", 'medozonuo@gmail.com', 'GPK'),
    Faculty("Tiamongla", "B.Tech(Civil)", "8837089881", 'mongshitzudir9615@gmail.com', 'GPK'),
    Faculty("Limasenla", "B.E(Civil)", "7085811923", 'asenshijoh12@gmail.com', 'GPK'),
    Faculty("Ketoulhoukho Kengurusie", "M.Tech(CTM)", "8787705284", 'akhorusie@gmail.com', 'GPK'),
    Faculty("Petesetuo", "M.Sc(Physics)", "9612336146", 'petekets01@gmail.com', 'GPK'),
    Faculty("Puthu Vitsu", "M.Sc (Chemistry)", "986298868", 'GPK'),
    Faculty("Yibenthung Tungoe", "BE(CSE),ME(CSE)", "8731950457", 'yibenthungtungoe@gmail.com', 'GPK'),
    Faculty("Viketol Thol", "B.E(CS & E)", "9862376252", 'viketol84@gmail.com', 'GPK'),
    Faculty("Athalie Dolie", "B.Tech", "8837204136", 'athaliedolie@gmail.com', 'GPK'),
    Faculty("Yimayangba", "B.Tech(CSE)", "9366075934", 'ayanggpk111@gmail.com', 'GPK'),
    Faculty("Abeno Odyuo", "M.Tech", "7389442385", 'benodys@gmail.com', 'GPK'),
    Faculty("Punyi Krocha", "BA (PGD)", "8413957587", 'punyikrocha1@gmail.com', 'GPK'),
    Faculty("Rusou Shupao", "BA", "9615244604", 'rosuoshupao79@gmail.com', 'GPK'),
    Faculty("Pelesituo Theunuo", "(ITI) Matriculate", "8974610999", 'pelesituotheunuo@gmail.com', 'GPK'),
    Faculty("Pfuvosa Thingo", "(ITI) Matriculate", "8837017483", 'pfuvosathingo@gmail.com', 'GPK'),

  ];
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void set(String value) {
    state = value;
  }
}

@riverpod
List<Faculty> filteredFaculty(Ref ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final allFaculty = ref.watch(allFacultyProvider);
  if (query.isEmpty) {
    return allFaculty;
  }

  return allFaculty
      .where((faculty) => faculty.name.toLowerCase().contains(query))
      .toList();
}
