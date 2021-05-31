class Location {
  int id;
  String locationName;
  String theme;
  String fullDesc;
  String imageurl;
  String locationurl;

  Location({
    this.id,
    this.locationName,
    this.theme,
    this.fullDesc,
    this.imageurl,
    this.locationurl
  });

  Map<String, dynamic> toJson() => {
    'id':id,
    'locationName': locationName,
    'theme': theme,
    'fullDesc': fullDesc,
    'imageurl': imageurl,
    'locationurl': locationurl,
  };

}