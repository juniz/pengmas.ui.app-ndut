part of 'models.dart';

class TugasKebahagiaan {
  bool success;
  List<Tugaskebahagiaan> tugaskebahagiaan;
  String message;

  TugasKebahagiaan({this.success, this.tugaskebahagiaan, this.message});

  TugasKebahagiaan.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      tugaskebahagiaan = new List<Tugaskebahagiaan>();
      json['data'].forEach((v) {
        tugaskebahagiaan.add(new Tugaskebahagiaan.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tugaskebahagiaan = new Map<String, dynamic>();
    tugaskebahagiaan['success'] = this.success;
    if (this.tugaskebahagiaan != null) {
      tugaskebahagiaan['tugaskomunikasi'] =
          this.tugaskebahagiaan.map((v) => v.toJson()).toList();
    }
    tugaskebahagiaan['message'] = this.message;
    return tugaskebahagiaan;
  }
}

class Tugaskebahagiaan {
  int id;
  String nama;
  String detail;

  String createdAt;
  String updatedAt;

  Tugaskebahagiaan(
      {this.id, this.nama, this.detail, this.createdAt, this.updatedAt});

  Tugaskebahagiaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    detail = json['detail'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['detail'] = this.detail;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
