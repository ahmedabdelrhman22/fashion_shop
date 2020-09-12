import 'package:fashion_shop/db/cloth.dart';
import 'package:fashion_shop/db/order.dart';
import 'package:fashion_shop/db/shop.dart';
import 'package:fashion_shop/db/user.dart';


// ******************Dresses*************************
final _dress0 =
    Cloth(imageUrl: 'images/dresses/yellow-orange-street-style-01.jpg', name: 'Ladies V-neck ', price: 8.99);
final _dress1 =
Cloth(imageUrl: 'images/dresses/th_5.jpg', name: 'Polka Dot', price: 17.99);
final _dress2 =
Cloth(imageUrl: 'images/dresses/th_4.jpg', name: 'Slim Long', price: 14.99);
final _dress3 =
Cloth(imageUrl: 'images/dresses/th_3.jpg', name: 'Spaghetti', price: 13.99);
final _dress4 =
Cloth(imageUrl: 'images/dresses/th_2.jpg', name: 'National', price: 9.99);
final _dress5 =
Cloth(imageUrl: 'images/dresses/th.jpg', name: 'Round', price: 14.99);
final _dress6 =
Cloth(imageUrl: 'images/dresses/oh_my_those_tight_dresses_21.jpg', name: 'Lapel', price: 11.99);
final _dress7 = Cloth(
    imageUrl: 'images/dresses/KB-1.jpg', name: 'Short', price: 12.99);

// ******************T-shirt*************************

final _tshirt0 =
Cloth(imageUrl: 'images/T-shirt/th_2.jpg', name: 'Ladies V-neck ', price: 8.99);
final _tshirt1 =
Cloth(imageUrl: 'images/T-shirt/th.jpg', name: 'Polka Dot', price: 17.99);
final _tshirt2 =
Cloth(imageUrl: 'images/T-shirt/oldwhitemen-m1-1312.jpg', name: 'Slim Long', price: 14.99);
final _tshirt3 =
Cloth(imageUrl: 'images/T-shirt/Fabstone-Collection-Grey-Round-T-SDL864524417-1-1f068.jpg', name: 'Spaghetti', price: 13.99);
final _tshirt4 =
Cloth(imageUrl: 'images/T-shirt/f2feea1884c3fff3a469571e66572d99--fitness-shirts-man-clothes.jpg', name: 'National', price: 9.99);
final _tshirt5 =
Cloth(imageUrl: 'images/T-shirt/Cotton-Polo-T-shirt-for-men.-Plain-Solid-design-with-Collar-Purple-front-right.jpg', name: 'Round', price: 14.99);
final _tshirt6 =
Cloth(imageUrl: 'images/T-shirt/980597779_788.jpg', name: 'Lapel', price: 11.99);
//****************Nike***********************
final _shoes0 =
Cloth(imageUrl: 'images/shoes/th_6.jpg', name: 'Ladies V-neck ', price: 8.99);
final _shoes1 =
Cloth(imageUrl: 'images/shoes/th_5.jpg', name: 'Polka Dot', price: 17.99);
final _shoes2 =
Cloth(imageUrl: 'images/shoes/th_4.jpg', name: 'Slim Long', price: 14.99);
final _shoes3 =
Cloth(imageUrl: 'images/shoes/th_3.jpg', name: 'Spaghetti', price: 13.99);
final _shoes4 =
Cloth(imageUrl: 'images/shoes/th_2.jpg', name: 'National', price: 9.99);
final _shoes5 =
Cloth(imageUrl: 'images/shoes/nike-metcon-2.jpg', name: 'Round', price: 14.99);
final _shoes6 =
Cloth(imageUrl: 'images/shoes/maxresdefault.jpg', name: 'Lapel', price: 11.99);
//****************puma*******************************
final _puma0 =
Cloth(imageUrl: 'images/puma/th_3.jpg', name: 'Ladies V-neck ', price: 8.99);
final _puma1 =
Cloth(imageUrl: 'images/puma/th_2.jpg', name: 'Polka Dot', price: 17.99);
final _puma2 =
Cloth(imageUrl: 'images/puma/puma-sports-shoes-1452294.jpg', name: 'Slim Long', price: 14.99);
final _puma3 =
Cloth(imageUrl: 'images/puma/puma-armbanduhr-puma-10391-ultrasie-50-bold-black-white-pu103911005-schwarz-14837041_grande.jpg', name: 'Spaghetti', price: 13.99);
final _puma4 =
Cloth(imageUrl: 'images/puma/puma_campusreporter_blackbirch_bag_lg.jpg', name: 'National', price: 9.99);
final _puma5 =
Cloth(imageUrl: 'images/puma/puma mostro femme t 36,chaussure puma pas chere[TeDe8vPCgs](2).jpg', name: 'Round', price: 14.99);
final _puma6 =
Cloth(imageUrl: 'images/puma/36026308_8.jpg', name: 'Lapel', price: 11.99);

//****************adidas*******************************
final _adidas0 =
Cloth(imageUrl: 'images/adidas/wholesale-mens-womens-adidas-shoes-replica-shoes-31740.jpg', name: 'Ladies V-neck ', price: 8.99);
final _adidas1 =
Cloth(imageUrl: 'images/adidas/th_3.jpg', name: 'Polka Dot', price: 17.99);
final _adidas2 =
Cloth(imageUrl: 'images/adidas/th_2.jpg', name: 'Slim Long', price: 14.99);
final _adidas3 =
Cloth(imageUrl: 'images/adidas/adidas-saddlebag-organizer-adiacc02c.jpg', name: 'Spaghetti', price: 13.99);
final _adidas4 =
Cloth(imageUrl: 'images/adidas/adidas-p-football-fw16-gamedayplus-media-slider-product-5_103421.jpg', name: 'National', price: 9.99);
final _adidas5 =
Cloth(imageUrl: 'images/adidas/adidas-equipment-running-support-93-black-white-2.jpg', name: 'Round', price: 14.99);
final _adidas6 =
Cloth(imageUrl: 'images/adidas/8132427_orig.jpg', name: 'Lapel', price: 11.99);
// Restaurants
final _shop0 = Shop(
  imageUrl: 'images/logo/1043657-beautiful-puma-logo-wallpaper-2241x1284.jpg',
  name: 'PUMA',
  address: '20 Main St, Cairo, EG',
  rating: 5,
  menu: [_puma0, _puma1, _puma2, _puma3, _puma4,_puma5,_puma6],
);
final _shop1 = Shop(
  imageUrl: 'images/logo/adidas_logo.gif',
  name: 'adidas',
  address: '34 st, Cairo, EG',
  rating: 4,
  menu: [_adidas0, _adidas1, _adidas2, _adidas3, _adidas4,_adidas5,_adidas6],
);
final _shop2 = Shop(
  imageUrl: 'images/logo/Nike_Swoosh_Logo_White_native_1600.jpg',
  name: 'Nike',
  address: '200 Main St, New York',
  rating: 4,
  menu: [_shoes0, _shoes1, _shoes2, _shoes3, _shoes4,_shoes5,_shoes6]
);
final _shop3 = Shop(
  imageUrl: 'images/logo/th_2.jpg',
  name: 'Dee Black',
  address: '5th, New Cairo',
  rating: 2,
  menu: [_dress0, _dress1, _dress2, _dress3, _dress4,_dress5,_dress6,_dress7],
);
final _shop4 = Shop(
  imageUrl: 'images/logo/T-shirt.jpg',
  name: 'T-shirt',
  address: '4th, tahreer square, EG',
  rating: 3,
  menu: [_tshirt0, _tshirt1, _tshirt2, _tshirt3, _tshirt4,_tshirt5,_tshirt6],
);

final List<Shop> shops = [
  _shop0,
  _shop1,
  _shop2,
  _shop3,
  _shop4,
];
final List<Cloth> clothes = [
  _puma0, _puma1, _puma2, _puma3, _puma4,_puma5,_puma6,
  _adidas0, _adidas1, _adidas2, _adidas3, _adidas4,_adidas5,_adidas6,
  _shoes0, _shoes1, _shoes2, _shoes3, _shoes4,_shoes5,_shoes6,
  _dress0, _dress1, _dress2, _dress3, _dress4,_dress5,_dress6,_dress7,
  _tshirt0, _tshirt1, _tshirt2, _tshirt3, _tshirt4,_tshirt5,_tshirt6,
];

// User
final currentUser = UserData(
  name: 'Ahmed bdelrhman',
  orders: [
    Order(
      date: 'Nov 10, 2019',
      cloth: _dress0,
      shop: _shop2,
      quantity: 1,
    ),
    Order(
      date: 'Nov 8, 2019',
      cloth: _dress1,
      shop: _shop0,
      quantity: 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      cloth: _dress2,
      shop: _shop1,
      quantity: 2,
    ),
    Order(
      date: 'Nov 2, 2019',
      cloth: _dress3,
      shop: _shop3,
      quantity: 1,
    ),
    Order(
      date: 'Nov 1, 2019',
      cloth: _dress4,
      shop: _shop4,
      quantity: 1,
    ),
  ],
  cart: [],
  phone: "010123456789",
  img: "assets/images/moh.jpg",
  favshop: [],
);

//Order(
//date: 'Nov 11, 2019',
//food: _burger,
//restaurant: _restaurant2,
//quantity: 2,
//),
//Order(
//date: 'Nov 11, 2019',
//food: _pasta,
//restaurant: _restaurant2,
//quantity: 1,
//),
//Order(
//date: 'Nov 11, 2019',
//food: _salmon,
//restaurant: _restaurant3,
//quantity: 1,
//),
//Order(
//date: 'Nov 11, 2019',
//food: _pancakes,
//restaurant: _restaurant4,
//quantity: 3,
//),
//Order(
//date: 'Nov 11, 2019',
//food: _burrito,
//restaurant: _restaurant1,
//quantity: 2,
//),
