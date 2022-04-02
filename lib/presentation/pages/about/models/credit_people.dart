import 'package:equatable/equatable.dart';

class CreditPeople extends Equatable {
  const CreditPeople(this.name, this.url);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
