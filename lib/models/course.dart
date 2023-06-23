class Course {
  String author;
  String title;
  String imgurl;
  //String imageurl;

  Course(this.author, this.title, this.imgurl);

  static List<Course> generatecourse() {
    return [
      Course('Gitungo rose', 'Arithmetic', 'lib/images4p/maths.png'),
      Course('Sandra PArk', 'Geometry', 'lib/images4p/english.jpg'),
      Course('Sandra Not PArk', 'Science', 'lib/images4p/science.png'),
    ];
  }
}
