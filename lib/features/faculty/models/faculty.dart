class Faculty {
  String name;
  String qualification;
  String? number;
  String? email;
  String? address;
  String? imgUrl;
  Faculty({
    required this.name,
    required this.qualification,
    this.number,
    this.email,
    this.address,
    this.imgUrl,
  });

  factory Faculty.fromJson(Map<String, dynamic> source) {
    return Faculty(
      name: source['name'] as String,
      qualification: source['qualification'] as String,
      number: source['number'] as String?,
      email: source['email'] as String?,
      address: source['address'] as String?,
      imgUrl: source['imgUrl'] as String?,
    );
  }
}
