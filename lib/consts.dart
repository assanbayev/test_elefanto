import 'package:test_elefanto/font_consts/app_strings.dart';
import 'package:test_elefanto/model/news_sales_card.dart';

import 'screens/main_content/bottom_navbar.dart';

const List<String> welcome_images_url = [
  'assets/images/welcome/welcome1.png',
  'assets/images/welcome/welcome2.png',
  'assets/images/welcome/welcome3.png',
  'assets/images/welcome/welcome4.png',
];
const List<String> welcome_images_expl = [
  'Мы знаем, как сделать ваш шопинг удобным и выгодным',
  'Как получать вознаграждение за покупки в ТРЦ MEGA',
  'Узнавайте первыми о новостях и скидках в ваших любимых магазинах',
  'Приятного шоппинга'
];

const List<String> social_network_images_url = [
  'assets/images/social_networks/apple.png',
  'assets/images/social_networks/facebook.png',
  'assets/images/social_networks/google.png',
];

List<BottomNavBarItem> bottom_nav_bar_items = [
  BottomNavBarItem(
    iconPath: 'assets/svgs/main.svg',
    title: 'Главная',
  ),
  BottomNavBarItem(
    iconPath: 'assets/svgs/parking_lot.svg',
    title: 'Парковка',
  ),
  BottomNavBarItem(
    iconPath: 'assets/svgs/profile.svg',
    title: 'Профиль',
  ),
  BottomNavBarItem(
    iconPath: 'assets/svgs/menu.svg',
    title: 'Меню',
  ),
];

const String bottom_nav_bar_camera = 'assets/svgs/camera.svg';
const List<String> dropdown_sites_list_text = [
  'MEGA Almaty',
  'another place1',
  'another plays2'
];

const List<String> categories_images_url = [
  'assets/images/categories/buy.png',
  'assets/images/categories/restaurant.png',
  'assets/images/categories/game.png',
  'assets/images/categories/cut.png'
];

const List<String> stories_images_url = [
  'assets/images/stories/1.png',
  'assets/images/stories/2.png',
  'assets/images/stories/3.png',
  'assets/images/stories/1.png',
  'assets/images/stories/2.png',
  'assets/images/stories/3.png',
];

const List<NewsSalesCard> news_list = [
  NewsSalesCard(
      hashtag: '#Магазины',
      title: 'Qazaq Republic',
      subtitle:
          'В ТРЦ MEGA Almaty открылся бутик казахстанского бренда Qazaq Republic Здесь вы можете найти различного вида',
      imgUrl: 'assets/images/news/news.png',
      isNew: true),
  NewsSalesCard(
      hashtag: '#Магазины2',
      title: 'Qazaq Republic2',
      subtitle:
          'В ТРЦ MEGA Almaty открылся бутик казахстанского бренда Qazaq Republic Здесь вы можете найти различного вида',
      imgUrl: 'assets/images/news/news.png',
      isNew: false),
];

const List<NewsSalesCard> sales_list = [
  NewsSalesCard(
      hashtag: '#Магазины',
      title: 'Весенние скидки',
      subtitle:
          'Весенние скидки на весенние товары до 23-го марта! Весенние скидки на весенние товары до 23-го марта! ',
      imgUrl: 'assets/images/categories/sales.png',
      isNew: false),
  NewsSalesCard(
      hashtag: '#Магазины2',
      title: 'Весенние скидки',
      subtitle:
          'Весенние скидки на весенние товары до 23-го марта! Весенние скидки на весенние товары до 23-го марта! ',
      imgUrl: 'assets/images/categories/sales.png',
      isNew: true),
];
const List<String> online_booking_imgs_list = [
  'assets/images/online_booking/1.png',
  'assets/images/online_booking/2.png'
];
const List<String> quest_imgs_list = [
  'assets/images/quests/1.png',
  'assets/images/quests/2.png'
];

const List<String> ankets_list = [first_anket_text, second_anket_text];
List<bool> was_ankets_passed_list = [true, false];
