part of 'services.dart';

abstract class TugasKebahagiaanRepo {
  Future<List<Tugaskebahagiaan>> getTugas(id);
}

class TugasKebahagiaanRepoImpl implements TugasKebahagiaanRepo {
  @override
  Future<List<Tugaskebahagiaan>> getTugas(id) async {
    var params = "tugas_kebahagiaans";

    var response = await http.get(Apiurl.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Tugaskebahagiaan> tugaskebahagiaan =
          TugasKebahagiaan.fromJson(data).tugaskebahagiaan;
      return tugaskebahagiaan;
    } else {
      throw Exception();
    }
  }
}
