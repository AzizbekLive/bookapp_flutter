part of 'dashboard_bloc.dart';@immutableabstract class DashboardEvent {}class BooksLoadEvent extends DashboardEvent {}class BookImageLoadEvent extends DashboardEvent {  final String url;  BookImageLoadEvent(this.url);}class BooksByCategoryEvent extends DashboardEvent {  final String category;  BooksByCategoryEvent(this.category);}class BookToPlayEvent extends DashboardEvent {  final String id;  BookToPlayEvent(this.id);}