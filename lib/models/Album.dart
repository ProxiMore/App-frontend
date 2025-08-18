class Album {
  final int id;
  final String title;
  final String author;
  final String? mediaUri;

  Album({
    required this.id,
    required this.title,
    required this.author,
    this.mediaUri,
  });
}
