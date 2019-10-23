import 'package:flutter/material.dart';

import '../page_index.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/widget/sliver.dart';

class ExpandStateBean {
  String title;
  IconData leading;
  List<SubExpandBean> children;

  ExpandStateBean({this.title, this.children, this.leading});

  static List<ExpandStateBean> expandStateList = [
    ExpandStateBean(
        leading: Icons.filter_1,
        title: 'Widgets Example',
        children: [
          SubExpandBean('Text', TextWidget()),
          SubExpandBean('Button', ButtonWidget()),
          SubExpandBean('ToggleButtons', ToggleButtonsWidget()),
          SubExpandBean('Image', ImageWidget()),
          SubExpandBean('Icon', IconWidget()),
          SubExpandBean('TextField', TextFieldWidget()),
          SubExpandBean('Slider', SliderWidget()),
          SubExpandBean('Range Slider', RangeSliderPage()),
          SubExpandBean('Chip', ChipWidget()),
          SubExpandBean('CheckSwitch', CheckSwitchWidget()),
          SubExpandBean('主题', ThemeSample()),
          SubExpandBean('ColorFiltered', ColorFilteredWidget()),
          SubExpandBean('ScrollNotification', ScrollNotificationDemo()),
        ]),
    ExpandStateBean(
        leading: Icons.filter_2,
        title: 'Layouts Example',
        children: [
          SubExpandBean('AppBar', AppBarWidget()),
          SubExpandBean('Dialog', DialogWidget()),
          SubExpandBean('Sliver1', SliverWidget()),
          SubExpandBean('Sliver2', SliverPage()),
          SubExpandBean('Sliver3', SliverDemo()),
          SubExpandBean('Table', TablePage()),
          SubExpandBean('日期时间选择', DateTimePicker()),
          SubExpandBean('BottomSheet', BottomSheetWidget()),
          SubExpandBean('滑动删除', DismissibleWidget()),
          SubExpandBean('毛玻璃', FrostingWidget()),
          SubExpandBean('Stepper', StepperWidget()),
          SubExpandBean('AspectRatio', AspectRatioSample()),
          SubExpandBean('ButtonBar', ButtonBarDemo()),
          SubExpandBean('InheritedWidget', InheritedWidgetTestContainer()),
        ]),
    ExpandStateBean(
        leading: Icons.filter_3,
        title: 'NavigationBar Example',
        children: [
          SubExpandBean('TabBar', TabBarHomePage()),
          SubExpandBean('BottomNavigationBar', BottomNavigationBarHomePage()),
          SubExpandBean('NavigationBarShifting', NavigationBarShifting()),
          SubExpandBean('NavigationBarFixed', NavigationBarFixed()),
          SubExpandBean('BubbleBottomBar', BubbleBottomBarPage()),
          SubExpandBean('不规则底部导航栏', BottomAppbarSample()),
          SubExpandBean('FancyBottomNavigationBar', FancyBottomNavigationBar()),
          SubExpandBean('CurvedNavigationBar', CurvedNavigationBarSample()),
          SubExpandBean('CupertinoTabBar', CupertinoTabBarSample()),
          SubExpandBean('BottomBarView', BottomBarViewDemo()),
          SubExpandBean('Titled Bottom Bar', TitledNavigationBarDemo()),
        ]),
    ExpandStateBean(
        leading: Icons.filter_4,
        title: 'Animation Example',
        children: [
          SubExpandBean('Curves', CurvesDemo()),
          SubExpandBean('AnimatedContainer', AnimatedContainerDemo()),
          SubExpandBean('AnimatedOpacity', AnimatedOpacityDemo()),
          SubExpandBean('AnimatedSwitcher', AnimatedSwitcherSample()),
          SubExpandBean('AnimatedCrossFade', AnimatedCrossFadeDemo()),
          SubExpandBean('AnimatedBuilder', AnimatedBuilderDemo()),
          SubExpandBean('AnimatedIcons', AnimatedIconsDemo()),
          SubExpandBean('AnimatedPadding', AnimatedPaddingDemo()),
          SubExpandBean('AnimatedSize', AnimatedSizeDemo()),
          SubExpandBean('AnimatedAlign', AnimatedAlignDemo()),
          SubExpandBean('AnimatedPositioned', AnimatedPositionedDemo()),
          SubExpandBean('AnimatedNumber', AnimatedNumberDemo()),
          SubExpandBean('Tween', TweenDemo()),
          SubExpandBean('自定义动画', CustomAnimationDemo()),
        ]),
    ExpandStateBean(
        leading: Icons.filter_5,
        title: 'Third Plugins Example',
        children: [
          SubExpandBean('Wave', WavePage()),
          SubExpandBean('Swiper', SwiperSample()),
          SubExpandBean('LikeButton', LikeButtonPage()),
          SubExpandBean('时间流', TimeLinePage()),
          SubExpandBean('LoadImage', LoadImageWidget()),
          SubExpandBean('RoundedLetter', RoundedLetterWidget()),
          SubExpandBean('Flipper', FlipperWidget()),
          SubExpandBean('FlipView Sample', FlutterFlipViewSample()),
          SubExpandBean('FlipView Custom', FlipViewCustom()),
          SubExpandBean('ContactPicker', ContactPickerWidget()),
          SubExpandBean('瀑布流示例', StaggeredViewPage()),
          SubExpandBean('评分控件', StarRatingWidget()),
          SubExpandBean('Clippy', ClippyWidget()),
          SubExpandBean('城市选择控件', CityPickerPage()),
          SubExpandBean('iOS风格城市选择控件', IosCityPickersPage()),
          SubExpandBean('fullpage风格城市选择控件', FullpageCityPickersPage()),
          SubExpandBean('设备信息', DeviceInfoPage()),
          SubExpandBean('二维码（生成/扫描）', QrImageWidget()),
          SubExpandBean('图表示例', ChartsWidget()),
          SubExpandBean('本地读取json数据', LoadingJsonPage()),
          SubExpandBean('侧滑菜单示例', InnerDrawerSample()),
          SubExpandBean('路由过渡动画', RouteSample()),
          SubExpandBean('DropDown', DropDownSample()),
          SubExpandBean('Image Colors', ImageColors()),
          SubExpandBean('尺子', RulerSample()),
          SubExpandBean('Preview', PreviewSample()),
          SubExpandBean('高德地图定位', AMapLocationDemo()),
          SubExpandBean('SecondFloor', SecondFloorDemo()),
          SubExpandBean('视差图片效果', ParallaxImageDemo()),
          SubExpandBean('骨架屏示例', ShimmerDemo()),
          SubExpandBean('录音', SoundDemo()),
        ]),
    ExpandStateBean(leading: Icons.filter_6, title: 'UI Challenges', children: [
      SubExpandBean('登录页面1', PasswordLoginPage()),
      SubExpandBean('登录页面2', LogonPage()),
      SubExpandBean('登录页面3', SlidingLoginPage()),
      SubExpandBean('登录页面4', SignUpPage()),
      SubExpandBean('登录页面5', BottomSheetLoginPage()),
      SubExpandBean('登录页面6', OnboardingPage()),
      SubExpandBean('视频背景登录页面', LoginVideoPage()),
      SubExpandBean('Music Player', FluteMusicPlayerPage()),
      SubExpandBean('Audio Player', AudioPlayersPage()),
      SubExpandBean('Flutter Sound', FlutterSoundPage()),
      SubExpandBean('CardFlip', CardFlipPage()),
      SubExpandBean('仿抖音首页动画', TikTokPage()),
      SubExpandBean('BackDrop', BackDropPage()),
    ]),
    ExpandStateBean(
        leading: Icons.filter_7,
        title: 'Projects Example',
        children: [
          SubExpandBean('仿追书神器', BookReaderHomePage()),
          SubExpandBean('仿好奇心日报', QDailySplashPage()),
          SubExpandBean('豆瓣电影', MovieHomePage()),
          SubExpandBean('百姓生活+', IndexPage()),
          SubExpandBean('我是个句子迷', SplashPage()),
          SubExpandBean('有道精品课', YouDaoHomePage()),
          SubExpandBean('每日一文', OneArticlePage()),
          SubExpandBean('元素周期表', ElementsPage()),
          SubExpandBean('Question', QuizPage()),
          SubExpandBean('仿朋友圈', WeChatFriendsCircle()),
          SubExpandBean('MVP Demo', MvpHomePage()),
          SubExpandBean('Flutter 第一个Demo', RandomWords()),
        ]),
  ];
}

class SubExpandBean {
  String title;
  Widget page;

  SubExpandBean(this.title, this.page);
}

List<String> bannerImages = [
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2918882617,1624283714&fm=26&gp=0.jpg",
  'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1694196096,1956817301&fm=26&gp=0.jpg',
  'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3473128871,1574804327&fm=26&gp=0.jpg',
  'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=422401622,3669771322&fm=26&gp=0.jpg',
  'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2832342280,1019704477&fm=26&gp=0.jpg',
  'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1759214474,1595279735&fm=26&gp=0.jpg',
  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4024827225,1981202973&fm=26&gp=0.jpg',
  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2029082490,2363810538&fm=26&gp=0.jpg',
  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2785384588,322545246&fm=26&gp=0.jpg',
  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=384115025,2366469586&fm=26&gp=0.jpg',
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=556889999,3306363683&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4074334908,1434307869&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2662785624,2609285852&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3182788030,321513843&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2925061987,411404233&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4176017085,1014898947&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1151904050,4162194237&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=379622373,74041926&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3312451982,3816676872&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2313290898,4177083589&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1114909265,4252356893&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3496053885,3190325716&fm=26&gp=0.jpg",
  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=322974403,2804872580&fm=26&gp=0.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2623563115,731719555&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1720211335,232769932&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3596808855,380159611&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3624286312,3700724023&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1459903101,4085466206&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1147935470,1225963007&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2306794792,159490749&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1623879114,795577895&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3509350334,2584391832&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3335334756,3364879534&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3649689340,3293497883&fm=26&gp=0.jpg",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4174052176,1211122446&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3351677703,1391797338&fm=26&gp=0.jpg",
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

class LinearSales {
  final int time;
  final int sales;

  LinearSales(this.time, this.sales);
}

/// Sample linear data type.
class LinearSaless {
  final int year;
  final int yearLower;
  final int yearUpper;
  final int sales;
  final int salesLower;
  final int salesUpper;
  final double radius;

  LinearSaless(this.year, this.yearLower, this.yearUpper, this.sales,
      this.salesLower, this.salesUpper, this.radius);
}

class ChartFlutterBean {
  static List<charts.Series<TimeSeriesSales, DateTime>> createSampleData0() {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 15),
      TimeSeriesSales(DateTime(2017, 9, 26), 25),
      TimeSeriesSales(DateTime(2017, 10, 9), 20),
      TimeSeriesSales(DateTime(2017, 10, 10), 75),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }

  //饼状图
  static List<charts.Series<LinearSales, int>> createSampleData1() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.time,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];

    //点
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSaless, int>> createSampleData3() {
    final data = [
      LinearSaless(10, 7, 10, 25, 20, 25, 5.0),
      LinearSaless(13, 11, 13, 225, 205, 225, 5.0),
      LinearSaless(34, 34, 24, 150, 150, 130, 5.0),
      LinearSaless(37, 37, 57, 10, 10, 12, 6.5),
      LinearSaless(45, 35, 45, 260, 300, 260, 8.0),
      LinearSaless(56, 46, 56, 200, 170, 200, 7.0),
    ];

    final maxMeasure = 300;

    return [
      charts.Series<LinearSaless, int>(
        id: 'Sales',
        // Providing a color function is optional.
        colorFn: (LinearSaless sales, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSaless sales, _) => sales.year,
        domainLowerBoundFn: (LinearSaless sales, _) => sales.yearLower,
        domainUpperBoundFn: (LinearSaless sales, _) => sales.yearUpper,
        measureFn: (LinearSaless sales, _) => sales.sales,
        measureLowerBoundFn: (LinearSaless sales, _) => sales.salesLower,
        measureUpperBoundFn: (LinearSaless sales, _) => sales.salesUpper,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSaless sales, _) => sales.radius,
        data: data,
      )
    ];
  }

  //条形图：
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final desktopSalesDataA = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    final tableSalesDataA = [
      OrdinalSales('2014', 25),
      OrdinalSales('2015', 50),
      OrdinalSales('2016', 10),
      OrdinalSales('2017', 20),
    ];

    final mobileSalesDataA = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', 15),
      OrdinalSales('2016', 50),
      OrdinalSales('2017', 45),
    ];

    final desktopSalesDataB = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    final tableSalesDataB = [
      OrdinalSales('2014', 25),
      OrdinalSales('2015', 50),
      OrdinalSales('2016', 10),
      OrdinalSales('2017', 20),
    ];

    final mobileSalesDataB = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', 15),
      OrdinalSales('2016', 50),
      OrdinalSales('2017', 45),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataA,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Desktop B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataB,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataB,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataB,
      ),
    ];
  }

  List<charts.Series<OrdinalSales, String>> getData() {
    final desktopSalesData = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
      OrdinalSales('2014', 25),
      OrdinalSales('2015', 50),
      OrdinalSales('2016', 10),
      OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      OrdinalSales('2014', 10),
      OrdinalSales('2015', 15),
      OrdinalSales('2016', 50),
      OrdinalSales('2017', 45),
    ];

    final otherSalesData = [
      OrdinalSales('2014', 20),
      OrdinalSales('2015', 35),
      OrdinalSales('2016', 15),
      OrdinalSales('2017', 10),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Other',
        insideLabelStyleAccessorFn: (T, int) {
          return charts.TextStyleSpec(color: charts.Color.transparent);
        },
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: otherSalesData,
      ),
    ];
  }
}

var backgroundImage =
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1444433231,507640515&fm=11&gp=0.jpg';

var douBanDefaultImage =
    "https://img1.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png";

String weatherBg(String condCode) {
  String bgImage = '';
  switch (condCode) {
    case '100':
    case '200':
    case '201':
    case '202':
    case '203':
    case '204':
    case '205':
    case '206':
    case '207':
    case '208':
    case '209':
    case '210':
    case '211':
    case '212':
    case '213':
    case '999':
      bgImage = 'images/weather_backgrounds/back_100d.jpg';
      break;
    case '101':
    case '102':
    case '103':
      bgImage = 'images/weather_backgrounds/back_101d.jpg';
      break;
    case '104':
      bgImage = 'images/weather_backgrounds/back_104d.jpg';
      break;
    case '300':
    case '301':
    case '305':
    case '306':
    case '307':
    case '308':
    case '309':
    case '310':
    case '311':
    case '312':
    case '313':
    case '314':
    case '315':
    case '316':
    case '317':
    case '318':
    case '399':
      bgImage = 'images/weather_backgrounds/back_300d.jpg';
      break;
    case '302':
    case '303':
    case '304':
      bgImage = 'images/weather_backgrounds/back_302d.jpg';
      break;
    case '400':
    case '401':
    case '402':
    case '403':
    case '404':
    case '405':
    case '406':
    case '407':
    case '408':
    case '409':
    case '410':
    case '499':
      bgImage = 'images/weather_backgrounds/back_400d.jpg';
      break;
    case '500':
    case '501':
    case '509':
    case '510':
    case '514':
    case '515':
      bgImage = 'images/weather_backgrounds/back_500d.jpg';
      break;
    case '502':
    case '511':
    case '512':
    case '513':
      bgImage = 'images/weather_backgrounds/back_502d.jpg';
      break;
    case '503':
    case '504':
    case '507':
    case '508':
      bgImage = 'images/weather_backgrounds/back_503d.jpg';
      break;
    case '900':
      bgImage = 'images/weather_backgrounds/back_900d.jpg';
      break;
    case '901':
      bgImage = 'images/weather_backgrounds/back_901d.jpg';
      break;
    default:
      bgImage = 'images/weather_backgrounds/back_100d.jpg';
      break;
  }
  return bgImage;
}

const List<String> QDailyKeys = <String>[
  "好莱坞",
  "亚马逊",
  "阿里巴巴",
  "音乐节",
  "特斯拉",
  "腾讯",
  "苹果",
  "海淘",
  "百度",
  "Google",
  "小米",
  "时尚",
  "迪士尼",
  "万达",
  "星巴克",
  "人工智能",
  "无人机",
  "华为",
  "MUJI",
  "宜家"
];

List<String> guideList = [
  "images/qdaily/bg_whatsnew_bg_1.jpg",
  "images/qdaily/bg_whatsnew_bg_2.jpg",
  "images/qdaily/bg_whatsnew_bg_3.jpg"
];
