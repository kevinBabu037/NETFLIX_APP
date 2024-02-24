

class Movie{
  String title;
  String backdropPath;
  String orginalTitle;
  String overview;
  String posterPath; 
  String releaseDate;

   Movie({
    required this.backdropPath,
    required this.orginalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate, 
    required this.title
   });

   factory Movie.fromJson(Map <String, dynamic>json){
    return Movie(
      backdropPath: json['backdrop_path']??[],
      orginalTitle:json['original_title']??[] ,
      overview: json['overview']??[], 
      posterPath:json['poster_path']??[] ,
      releaseDate:json['release_date']??[] ,
      title:json['title']??[] );
   }

}


