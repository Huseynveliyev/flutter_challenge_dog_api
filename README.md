
# flutter-challenge doge api 

these are the packages that use: 
// http request package 
dio: ^5.3.3

//state managment solution
flutter_bloc: ^8.1.3 and equatable


The application consists of 4 pages. The binders are processed in ayri on each page in order. A task is placed on each page. The application consists of 2 main layers. These layers are with cirasi: prestation and data layer. The principle of playing the application is as follows:
Presentation -> State Management(Cubit) layer -> Repository layer -> > Service layer
The app is simply stolen like this. I tried to write in the cleanest way.

