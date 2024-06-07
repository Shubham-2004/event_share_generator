class ImageData {
  final String imageUrl;
  final String title;
  final String date;
  final String time;

  ImageData({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    // Generating dummy date and time for the example
    String dateTime = DateTime.now().toString();
    String date = dateTime.split(' ')[0];
    String time = dateTime.split(' ')[1].split('.')[0];

    return ImageData(
      imageUrl: json['download_url'],
      title: json['author'],
      date: date,
      time: time,
    );
  }
}
