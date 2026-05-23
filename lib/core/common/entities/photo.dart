import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable{
  const PhotoEntity({required this.id, required this.author, required this.imageUrl});

  final String id;
  final String author;
  final String imageUrl;
  
  @override
  List<Object> get props => [id, author, imageUrl];
}
