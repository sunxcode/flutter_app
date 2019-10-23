import 'dart:convert';

import 'package:dio/dio.dart';

import '../bean/index.dart';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

import '../page_index.dart';

class ApiService {
  /// 豆瓣电影首页数据
  static Future<MovieHomeData> getMovieHomeData({String city}) async {
    Response response =
        await HttpUtils().request(ApiUrl.MOVIE_HOME_URL, data: {'city': city});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return MovieHomeData.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 豆瓣电影年度榜单
  static Future<RangesData> getMovieRanges(int year) async {
    Response response =
        await HttpUtils().request(ApiUrl.MOVIE_RANGE_URL, data: {'year': year});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return RangesData.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 获取正在热映电影
  static Future<List<Movie>> getNowPlayingList(
      {String city, int page = 1, int limit = 20}) async {
    Response response = await HttpUtils().request(ApiUrl.MOVIE_LIST_URL,
        data: {'city': city, 'page': page, 'limit': limit});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 获取即将上映电影
  static Future<List<Movie>> getComingList(
      {int page = 1, int limit = 20}) async {
    Response response = await HttpUtils()
        .request(ApiUrl.MOVIE_SOON_URL, data: {"page": page, 'limit': limit});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 获取排行榜电影
  static Future<List<Movie>> getRankingList(String url,
      {int start = 0, int count = 20}) async {
    Response response = await HttpUtils().request(url, data: null);
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 获取 top250 榜单
  static Future<List<Movie>> getTop250List(
      {int page = 1, int limit = 20}) async {
    Response response = await HttpUtils()
        .request(ApiUrl.MOVIE_TOP250_URL, data: {'page': page, 'limit': limit});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 根据标签搜索
  static Future<List<Movie>> getSearchListByTag(String tag,
      {int page = 1, int limit = 20, String type = "movie"}) async {
    Response response = await HttpUtils().request(
        ApiUrl.MOVIE_SEARCH_BY_TAG_URL,
        data: {'tag': tag, 'page': page, 'limit': limit, 'type': type});
    if (response == null || response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 找电影
  static Future<List<Movie>> getFilterList(
      {int page: 1,
      String range: "1,10",
      bool playable: false,
      bool unwatched: false,
      String yearRange,
      String countries,
      String genres,
      String sort,
      String type,
      String feature}) async {
    Response response =
        await HttpUtils().request(ApiUrl.MOVIE_FILTER_URL, data: {
      'page': page,
      'playable': playable ? 1 : null,
      "range": range,
      "unwatched": unwatched ? 1 : null,
      "year_range": yearRange,
      "countries": countries,
      "genres": genres,
      "sort": sort,
      "type": type,
      "feature": feature
    });
    if (response == null || response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 获取电影详情
  static Future<Movie> getMovieDetail(String id) async {
    Response response =
        await HttpUtils().request(ApiUrl.MOVIE_DETAIL_URL, data: {'id': id});
    if (response == null || response.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    if (result.code == 0) {
      return Movie.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 影人详细信息
  static Future<Celebrity> getActorDetail(String actorId) async {
    Response response = await HttpUtils()
        .request(ApiUrl.MOVIE_CELEBRITY_URL, data: {'id': actorId});
    if (response.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    if (result.code == 0) {
      return Celebrity.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 剧照
  static Future<List<Photos>> getPhotos(String type, String id,
      {int page = 1, int limit = 20}) async {
    Response response = await HttpUtils().request(ApiUrl.MOVIE_PHOTOS_URL,
        data: {'page': page, 'limit': limit, 'type': type, 'id': id});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Photos.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 影人作品
  static Future<List<Movie>> getActorMovies(String actorId,
      {int start = 1, int count = 20}) async {
    Response response = await HttpUtils().request(
        ApiUrl.MOVIE_CELEBRITY_WORKS_URL,
        data: {'page': start, 'limit': count, 'id': actorId});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Movie.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 短评
  static Future<List<Reviews>> getComments(String id,
      {int page = 1, int limit = 20}) async {
    Response response = await HttpUtils().request(ApiUrl.MOVIE_COMMENTS_URL,
        data: {'page': page, 'limit': limit, 'id': id});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Reviews.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 影评
  static Future<List<Reviews>> getReviews(String id,
      {int page = 1, int limit = 20}) async {
    Response response = await HttpUtils().request(ApiUrl.MOVIE_REVIEWS_URL,
        data: {'page': page, 'limit': limit, 'id': id});
    if (response.statusCode != 200) {
      return [];
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => Reviews.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 每日一文
  static Future<Article> getTodayArticle() async {
    Response response =
        await HttpUtils().request(ApiUrl.ARTICLE_TODAY_URL, data: null);
    if (response.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    if (result.code == 0) {
      return Article.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 特定日期文章
  static Future<Article> getDayArticle(String date) async {
    Response response =
        await HttpUtils().request(ApiUrl.ARTICLE_DAY_URL, data: {'date': date});
    if (response.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    if (result.code == 0) {
      return Article.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 随机文章
  static Future<Article> getRandomArticle() async {
    Response response =
        await HttpUtils().request(ApiUrl.ARTICLE_RANDOM_URL, data: null);
    if (response.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));
    if (result.code == 0) {
      return Article.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 得到实况天气
  static Future<HeWeather> getHeWeatherNow(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.WEATHER_NOW, data: {
      "location": city,
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 得到逐小时天气
  static Future<HeWeather> getHeWeatherHourly(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.WEATHER_HOURLY, data: {
      "location": city,
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 得到3-10天天气
  static Future<HeWeather> getHeWeatherForecast(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.WEATHER_FORECAST, data: {
      "location": city,
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 常规天气数据集合
  static Future<HeWeather> getHeWeather(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.WEATHER, data: {
      "location": city,
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 日出日落
  static Future<HeWeather> getSunriseSunset(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.SUNRISE_SUNSET, data: {
      "location": city,
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 空气质量数据集合
  static Future<HeWeather> getAir(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.AIR, data: {
      "location": city, // 所查询地区的纬度 纬度采用十进制格式，北纬为正，南纬为负
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 空气质量实况
  static Future<HeWeather> getAirNow(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.AIR_NOW, data: {
      "location": city, // 所查询地区的纬度 纬度采用十进制格式，北纬为正，南纬为负
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 生活指数
  static Future<HeWeather> getLifeStyle(String city) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.WEATHER_BASE_URL)
        .request(ApiUrl.LIFESTYLE, data: {
      "location": city, // 所查询地区的纬度 纬度采用十进制格式，北纬为正，南纬为负
      "key": Config.HE_WEATHER_KEY,
      'unit': 'm', // 单位选择，公制（m）或英制（i），默认为公制单位
      'lang': 'zh', // 多语言，可以不使用该参数，默认为简体中文
    });
    if (response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.heWeather[0];
  }

  /// 热门城市
  static Future<List<City>> getHotCities(
      {String group: 'world', int number: 50}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.CITY_BASE_URL)
        .request(ApiUrl.CITY_TOP, data: {
      "group": "world",
      "key": Config.HE_WEATHER_KEY,
      "number": 50,
    });
    if (response.statusCode != 200) {
      return null;
    }
    return City.fromMapList(
        json.decode(response.data)['HeWeather6'][0]['basic']);
  }

  /// 搜索城市
  static Future<List<City>> getSearchCities(String keyword) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.CITY_BASE_URL)
        .request(ApiUrl.CITY_FIND, data: {
      "location": keyword,
      "group": "cn",
      // group=world 查询全球城市（默认值）;group=cn 仅查询中国城市;group=us,scenic 查询美国城市和中国景点地区;group=cn,us,ru 查询中国、美国和俄罗斯城市
      "key": Config.HE_WEATHER_KEY,
      "number": 20,
      'mode': 'match'
      // 查询方式（模糊检索 or 精准检索） 可选值: equal、match，默认：match
    });
    if (response.statusCode != 200) {
      return null;
    }
    return City.fromMapList(
        json.decode(response.data)['HeWeather6'][0]['basic']);
  }

  /// 煎蛋XXOO图
  static Future<List<Comment>> getJiandan(int page) async {
    Response response = await HttpUtils().request(ApiUrl.JIANDAN, data: {
      "page": page,
      'oxwlxojflwblxbsapi': 'jandan.get_ooxx_comments',
    });
    if (response.statusCode != 200) {
      return null;
    }
    return Comment.fromMapList(json.decode(response.data)['comments']);
  }

  /// 百姓生活首页数据接口
  static Future<Baixing> getBaixingHomeData(String lon, String lat) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BAIXING_BASE_URL)
        .request(ApiUrl.BAIXING_HOME,
            data: {
              "lon": lon,
              'lat': lat,
            },
            method: HttpUtils.POST);
    if (response.statusCode != 200) {
      return null;
    }
    if (json.decode(response.data)['code'] == '0') {
      return Baixing.fromMap(json.decode(response.data)['data']);
    } else {
      return null;
    }
  }

  /// 百姓生活首页火爆专区商品数据接口
  static Future<List<Goods>> getBaixingHomeHotData(int page) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BAIXING_BASE_URL)
        .request(ApiUrl.BAIXING_HOME_HOT,
            data: {
              "page": page,
            },
            method: HttpUtils.POST);
    if (response.statusCode != 200) {
      return null;
    }
    if (json.decode(response.data)['code'] == '0' &&
        json.decode(response.data)['data'] != null) {
      return Goods.fromMapList(json.decode(response.data)['data']);
    } else {
      return [];
    }
  }

  /// 百姓生活分类数据接口
  static Future<List<Category>> getBaixingCategoryData() async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BAIXING_BASE_URL)
        .request(ApiUrl.BAIXING_CATEGORY, method: HttpUtils.POST, data: null);
    if (response.statusCode != 200) {
      return null;
    }
    if (json.decode(response.data)['code'] == '0' &&
        json.decode(response.data)['data'] != null) {
      return Category.fromMapList(json.decode(response.data)['data']);
    } else {
      return [];
    }
  }

  /// 百姓生活分类商品数据接口
  static Future<List<Goods>> getBaixingGoodsData(
    int page,
    String categoryId,
    String categorySubId,
  ) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BAIXING_BASE_URL)
        .request(ApiUrl.BAIXING_GOODS,
            data: {
              "page": page,
              "categoryId": categoryId,
              "categorySubId": categorySubId,
            },
            method: HttpUtils.POST);
    if (response.statusCode != 200) {
      return null;
    }
    if (json.decode(response.data)['code'] == '0' &&
        json.decode(response.data)['data'] != null) {
      return Goods.fromMapList(json.decode(response.data)['data']);
    } else {
      return [];
    }
  }

  /// 百姓生活分类商品数据接口
  static Future<GoodsInfo> getBaixingGoodsDetailData(String goodId) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BAIXING_BASE_URL)
        .request(ApiUrl.BAIXING_GOODS_DETAIL,
            data: {
              "goodId": goodId,
            },
            method: HttpUtils.POST);
    if (response.statusCode != 200) {
      return null;
    }
    if (json.decode(response.data)['code'] == '0' &&
        json.decode(response.data)['data'] != null) {
      return GoodsInfo.fromMap(json.decode(response.data)['data']);
    } else {
      return null;
    }
  }

  static Future<List<Contact>> getRandomUser({
    int page: 1,
    int results: 50,
    String gender: '',
    String format: 'json',
    String nat: '',
  }) async {
    Response response =
        await HttpUtils(baseUrl: ApiUrl.RANDOMUSER_URL).request('', data: {
      "page": page,
      "results": results,
      "gender": gender,
      "format": format,
      "nat": nat,
    });
    if (response == null || response.statusCode != 200) {
      return null;
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.contacts;
  }

  /// 句子迷详情
  ///
  static Future<JuZiMi> getJuZiMiDetails(int id, String type) async {
    Response response = await HttpUtils()
        .request(ApiUrl.JUZIMI_DETAILS_URL, data: {"id": id, "type": type});
    if (response == null || response.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return JuZiMi.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 根据类别得到句子迷列表
  ///
  static Future<List<JuZiMi>> getJuZiMiListByType(String type, int page) async {
    Response response = await HttpUtils()
        .request(ApiUrl.JUZIMI_LIST_URL, data: {"type": type, "page": page});
    if (response == null || response.statusCode != 200) {
      return [];
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => JuZiMi.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 根据标签得到句子迷列表
  ///
  static Future<List<JuZiMi>> getJuZiMiListByTag(int id, int page) async {
    Response response = await HttpUtils().request(ApiUrl.JUZIMI_TAG_LIST_URL,
        data: {"page": page, "tag_id": id});
    if (response == null || response.statusCode != 200) {
      return [];
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return List()
        ..addAll((result.data as List ?? []).map((o) => JuZiMi.fromMap(o)));
    } else {
      return [];
    }
  }

  /// 360壁纸
  static Future<List<ImageModal>> getImagesData(String key) async {
    Response response =
        await HttpUtils(baseUrl: ApiUrl.MEIZITU_URL).request('j', data: {
      "src": 'imageonebox',
      "q": key,
      "obx_type": "360pic_meinv",
      "pn": 100,
      "sn": 0,
      "kn": 50,
      "cn": 0
    });
    if (response == null || response?.statusCode != 200) {
      return [];
    }
    Result result = Result.fromMap(json.decode(response.data));
    return result.images;
  }

  /// 获取全部新闻(首页)
  static Future<ResponseBean> getQDailyHomeData(String lastKey) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_HOME_DATA, data: {"last_key": lastKey});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 获取某分类下的新闻
  static Future<ResponseBean> getQDailyNewsDataByCategory(
      int tagId, String lastKey) async {
    Response response = await HttpUtils().request(ApiUrl.QDAILY_CATEGORY_DATA,
        data: {"last_key": lastKey, "tag_id": tagId});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 获取文章/新闻评论
  static Future<ResponseBean> getQDailyCommentData(int id,
      {String dataType = 'article', String lastKey = '0'}) async {
    Response response = await HttpUtils().request(ApiUrl.QDAILY_COMMENT_DATA,
        data: {"last_key": lastKey, "datatype": dataType, "id": id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 栏目列表
  static Future<ResponseBean> getQDailyColumnList(String lastKey) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_COLUMN_LIST, data: {"last_key": lastKey});
    if (response == null || response?.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 栏目信息
  static Future<ResponseBean> getQDailyColumnInfo(int columnId) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_COLUMN_INFO, data: {'column_id': columnId});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 栏目新闻
  static Future<ResponseBean> getQDailyColumnIndex(
      int columnId, String lastKey) async {
    Response response = await HttpUtils().request(ApiUrl.QDAILY_COLUMN_NEWS,
        data: {'last_key': lastKey, 'column_id': columnId});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 好奇心研究所
  static Future<ResponseBean> getQDailyLabsData(String lastKey) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_LABS_URL, data: {'last_key': lastKey});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 好奇心研究所详情
  static Future<ResponseBean> getQDailyLabsDetailData(int id) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_LAB_DETAIL, data: {'paper_id': id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 我说
  static Future<ResponseBean> getQDailyISay(int id, String lastKey) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_ISAY_URL, data: {'id': id, "last_key": lastKey});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 投票详情
  static Future<ResponseBean> getQDailyVote(int id) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_VOTE_URL, data: {'paper_id': id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 投票结果
  static Future<ResponseBean> getQDailyVoteResult(int id) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_VOTE_RESULT, data: {'paper_id': id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 42%详情
  static Future<ResponseBean> getQDailyTots(int id) async {
    Response response =
        await HttpUtils().request(ApiUrl.QDAILY_TOTS_URL, data: {'id': id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 你谁啊
  static Future<ResponseBean> getQDailyWho(int id) async {
    Response response =
        await HttpUtils().request(ApiUrl.QDAILY_WHO_URL, data: {'id': id});
    if (response == null || response?.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 你猜
  static Future<ResponseBean> getQDailyChoices(int id) async {
    Response response =
        await HttpUtils().request(ApiUrl.QDAILY_CHOICE_URL, data: {'id': id});

    if (response == null || response?.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 获取文章/新闻详情
  static Future<ResponseBean> getQDailyArticleInfoData(int articleId) async {
    Response response = await HttpUtils()
        .request(ApiUrl.QDAILY_ARTICLE_DETAIL, data: {'id': articleId});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// Topics新闻/文章
  static Future<ResponseBean> getQDailyTopicNews(int id, String lastKey) async {
    Response response = await HttpUtils().request(ApiUrl.QDAILY_TOPIC_NEWS_URL,
        data: {'topic_id': id, 'last_key': lastKey});
    if (response == null || response?.statusCode != 200) {
      return null;
    }
    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 搜索
  static Future<ResponseBean> getQDailySearchData(
      String keywords, String lastKey) async {
    Response response = await HttpUtils().request(ApiUrl.QDAILY_SEARCH_WEB,
        data: {"last_key": lastKey, "keyword": keywords});
    if (response == null || response?.statusCode != 200) {
      return null;
    }

    BaseResult result = BaseResult.fromMap(json.decode(response.data));

    if (result.code == 0) {
      return ResponseBean.fromMap(result.data);
    } else {
      return null;
    }
  }

  /// 获取文章/新闻详情
  static Future<DetailBean> getQDailyArticleData(int articleId) async {
    DetailBean articleDetail;

    String detailsHtml = '';
    bool longPage = false;
    List<String> tags = [];
    String image = '';

    Response response = await HttpUtils(baseUrl: ApiUrl.QDAILY_ARTICLE_URL)
        .request(":articleId", data: {'articleId': articleId});

    var document = parse(response.data.toString());

    dom.Element pageContent =
        document.getElementsByClassName('page-content').first;

    List<dom.Element> detailLongDiv =
        pageContent.getElementsByClassName('com-article-detail long');
    List<dom.Element> detailShortDiv =
        pageContent.getElementsByClassName('com-article-detail short');

    dom.Element detailDiv =
        detailLongDiv.length > 0 ? detailLongDiv.first : detailShortDiv.first;

    dom.Element detailBodyDiv =
        detailDiv.getElementsByClassName('article-detail-bd').first;
    dom.Element detailHeaderDiv =
        detailDiv.getElementsByClassName('article-detail-hd').first;
    dom.Element detailFooterDiv =
        detailDiv.getElementsByClassName('article-detail-ft').first;

    if (detailLongDiv.length > 0) {
      longPage = true;
    }

    if (detailShortDiv.length > 0) {
      longPage = false;
    }

    image = detailHeaderDiv
        .getElementsByClassName('banner')
        .first
        .querySelector('img')
        .attributes['data-src'];

    detailsHtml =
        detailBodyDiv.getElementsByClassName('detail').first.outerHtml;

    ////////////////////////////////////////////////////////////////

    List<dom.Element> tagsLi = detailFooterDiv
        .getElementsByClassName('tags items clearfix')
        .first
        .querySelectorAll('li');

    tagsLi.forEach((item) {
      tags.add(item.querySelector('span').text);
    });

    ////////////////////////////////////////////////////////////////
    List<PostBean> posts = [];

    List<dom.Element> banners = pageContent
        .getElementsByClassName('related-banners-bd')
        .first
        .querySelectorAll('a');

    banners.forEach((item) {
      int articleId = int.parse(item.attributes['href']
          .replaceAll('/mobile/articles/', '')
          .replaceAll('.html', ''));

      dom.Element bannerHd =
          item.getElementsByClassName('grid-key-article-hd').first;

      String image = bannerHd
          .getElementsByClassName('imgcover pic')
          .first
          .querySelector('img')
          .attributes['data-src'];

      print('-=-=-=-================----------$image');

      dom.Element bannerBd =
          item.getElementsByClassName('grid-key-article-bd').first;

      String title = bannerBd.getElementsByClassName('title').first.text;

      String category =
          bannerBd.querySelector('p').querySelectorAll('span')[1].text;

      dom.Element ribbonDiv = bannerBd.getElementsByClassName('ribbon').first;

      List<dom.Element> messageSpans =
          ribbonDiv.getElementsByClassName('iconfont icon-message');
      List<dom.Element> heartSpans =
          ribbonDiv.getElementsByClassName('iconfont icon-heart');

      int commentCount =
          messageSpans.length > 0 ? int.parse(messageSpans.first.text) : 0;

      int praiseCount =
          heartSpans.length > 0 ? int.parse(heartSpans.first.text) : 0;

      PostBean post = PostBean(
          image: image,
          id: articleId,
          title: title,
          categoryTile: category,
          commentCount: commentCount,
          praiseCount: praiseCount);

      posts..add(post);
    });

    articleDetail = DetailBean(
        description: detailsHtml,
        image: image,
        tags: tags,
        isFullPage: longPage,
        posts: posts);

    print(articleDetail.toString());

    return articleDetail;
  }

  /// 获取图书详情
  static Future<BookBean> getQDailyBookData(int articleId) async {
    BookBean bookDetail;

    String desc = '';
    List<String> tags = [];
    String detail = '';

    Response response = await HttpUtils(baseUrl: ApiUrl.QDAILY_ARTICLE_URL)
        .request(":articleId", data: {'articleId': articleId});

    var document = parse(response.data.toString());

    dom.Element pageContent =
        document.getElementsByClassName('page-content').first;

    dom.Element detailBodyDiv =
        pageContent.getElementsByClassName('article-detail-bd').first;
    dom.Element detailHeaderDiv =
        pageContent.getElementsByClassName('article-detail-hd').first;
    dom.Element detailFooterDiv =
        pageContent.getElementsByClassName('article-detail-ft').first;

    desc = detailHeaderDiv.getElementsByClassName('info').first.outerHtml;

    detail = detailBodyDiv.getElementsByClassName('detail').first.outerHtml;

    ////////////////////////////////////////////////////////////////

    List<dom.Element> tagsLi = detailFooterDiv
        .getElementsByClassName('tags items clearfix')
        .first
        .querySelectorAll('li');

    tagsLi.forEach((item) {
      tags.add(item.querySelector('span').text);
    });

    ////////////////////////////////////////////////////////////////
    List<PostBean> posts = [];

    List<dom.Element> banners = pageContent
        .getElementsByClassName('related-banners-bd')
        .first
        .querySelectorAll('a');

    banners.forEach((item) {
      int articleId = int.parse(item.attributes['href']
          .replaceAll('/mobile/articles/', '')
          .replaceAll('.html', ''));

      dom.Element bannerHd =
          item.getElementsByClassName('grid-key-article-hd').first;

      String image = bannerHd
          .getElementsByClassName('imgcover pic')
          .first
          .querySelector('img')
          .attributes['data-src'];

      print('-=-=-=-================----------$image');

      dom.Element bannerBd =
          item.getElementsByClassName('grid-key-article-bd').first;

      String title = bannerBd.getElementsByClassName('title').first.text;

      String category =
          bannerBd.querySelector('p').querySelectorAll('span')[1].text;

      dom.Element ribbonDiv = bannerBd.getElementsByClassName('ribbon').first;

      List<dom.Element> messageSpans =
          ribbonDiv.getElementsByClassName('iconfont icon-message');
      List<dom.Element> heartSpans =
          ribbonDiv.getElementsByClassName('iconfont icon-heart');

      int commentCount =
          messageSpans.length > 0 ? int.parse(messageSpans.first.text) : 0;

      int praiseCount =
          heartSpans.length > 0 ? int.parse(heartSpans.first.text) : 0;

      PostBean post = PostBean(
          image: image,
          id: articleId,
          title: title,
          categoryTile: category,
          commentCount: commentCount,
          praiseCount: praiseCount);

      posts..add(post);
    });

    bookDetail = BookBean(desc: desc, tags: tags, posts: posts, detail: detail);

    print(bookDetail.toString());

    return bookDetail;
  }

  /// 有道精品课首页上面部分数据
  static Future<YouDaoData> getYouDaoHomeHead(int t) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.YOUDAO_BASE_URL)
        .request(ApiUrl.YOUDAO_HOME_URL, data: {"t": t});
    if (response.statusCode != 200) {
      return null;
    }
    YoudaoResult result = YoudaoResult.fromMap(json.decode(response.data));
    return result.data;
  }

  /// 有道精品课所有分类及部分课程列表数据
  static Future<YouDaoData> getYouDaoHomeTags(List tags, int t) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.YOUDAO_BASE_URL)
        .request(ApiUrl.YOUDAO_HOME_LIST_URL,
            data: {"tagIds": tags.toString(), "t": t});
    if (response.statusCode != 200) {
      return null;
    }
    YoudaoResult result = YoudaoResult.fromMap(json.decode(response.data));
    return result.data;
  }

  /// 有道精品分组详情
  static Future<YouDaoData> getYouDaoGroupDetails(int tag) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.YOUDAO_BASE_URL)
        .request(ApiUrl.YOUDAO_GROUP_DETAILS_URL, data: {"tag": tag});
    if (response.statusCode != 200) {
      return null;
    }
    YoudaoResult result = YoudaoResult.fromMap(json.decode(response.data));
    return result.data;
  }

  /// 有道精品分组所有课程列表
  static Future<List<CoursesBean>> getYouDaoGroupCourseList(
      int tag, int rank, int time) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.YOUDAO_BASE_URL)
        .request(ApiUrl.YOUDAO_GROUP_ALL_COURSE_URL,
            data: {"tag": tag, "rank": rank, "time": time});
    if (response.statusCode != 200) {
      return null;
    }
    YoudaoResult result = YoudaoResult.fromMap(json.decode(response.data));
    return result.data.course;
  }

  /// 根据分类得到小说列表
  /// [gender] 性别 男生:mael 女生:female 出版:press
  /// [major] 大类别
  /// [minor] 小类别
  /// [type] 热门:hot 新书:new 好评:repulation 完结:over 包月: month
  /// [start] 分页位置，从0开始
  /// [limit] 分页条数
  ///
  static Future<List<Books>> getBookByCategories(String gender, String major,
      {int start: 0,
      int limit: 20,
      String minor: '',
      String type: 'hot'}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOKS_BY_CATEGORY_URL, data: {
      "gender": gender,
      "major": major,
      'type': type,
      "start": start,
      "limit": limit,
      "minor": minor
    });
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.books;
    } else {
      return [];
    }
  }

  /// 小说详情
  static Future<Books> getBookDetails(String id) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_DETAILS_URL, data: {"id": id});
    if (response.statusCode != 200) {
      return null;
    }

    Books book = Books.fromMap(json.decode(response.data));
    return book;
  }

  /// 相关推荐
  static Future<List<Books>> getBookByRecommend(String id) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_RECOMMEND_URL, data: {"id": id});
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.books;
    } else {
      return [];
    }
  }

  /// 小说书评列表
  static Future<BookResult> getBookReview(String id,
      {String sort: 'updated', int start: 0, int limit: 20}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL).request(
        ApiUrl.BOOK_REVIEW_URL,
        data: {"book": id, "sort": sort, "start": start, "limit": limit});
    if (response.statusCode != 200) {
      return null;
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result;
    } else {
      return null;
    }
  }

  /// 小说短评列表
  static Future<List<DocsBean>> getBookShortReview(String id,
      {String sort: 'updated', int start: 0, int limit: 20}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL).request(
        ApiUrl.BOOK_SHORT_REVIEW_URL,
        data: {"book": id, "sort": sort, "start": start, "limit": limit});
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.docs;
    } else {
      return [];
    }
  }

  /// 小说讨论列表
  static Future<List<Post>> getBookTalks(String id,
      {String sort: 'updated',
      int start: 1,
      int limit: 20,
      String type: 'normal'}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_TALK_URL, data: {
      "book": id,
      "sort": sort,
      "start": start,
      "limit": limit,
      "type": type
    });
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.posts;
    } else {
      return [];
    }
  }

  /// 获取小说正版源
  static Future<BtocResult> getBookBtocSource(String bookId) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL).request(
        ApiUrl.BOOK_BTOC_URL,
        data: {"book": bookId, 'view': 'summary'});
    if (response.statusCode != 200) {
      return null;
    }

    List<BtocResult> result = List()
      ..addAll((json.decode(response.data) as List ?? [])
          .map((o) => BtocResult.fromMap(o)));

    if (result.length > 0) {
      return result[0];
    } else {
      return null;
    }
  }

  /// 小说章节目录
  static Future<List<Chapters>> getBookChapters(String sourceId) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL).request(
        ApiUrl.BOOK_ATOC_URL,
        data: {"sourceId": sourceId, 'view': 'chapters'});
    if (response.statusCode != 200) {
      return [];
    }

    ChapterResult result = ChapterResult.fromMap(json.decode(response.data));
    if (result.chapters.length > 0) {
      return result.chapters;
    } else {
      return [];
    }
  }

  /// 小说章节详情
  static Future<ChapterInfo> getBookChapterInfo(String link) async {
    Response response = await HttpUtils().request(link, data: null);
    if (response.statusCode != 200) {
      return null;
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.chapter;
    } else {
      return null;
    }
  }

  /// 获取所有排行榜
  static Future<RankingResult> getBookRankings() async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_RANKING_URL, data: null);
    if (response.statusCode != 200) {
      return null;
    }

    RankingResult result = RankingResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result;
    } else {
      return null;
    }
  }

  /// 获取单一排行榜
  static Future<Ranking> getRankingBooks(String rankingId) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_RANKING_INFO_URL, data: {"rankingId": rankingId});
    if (response.statusCode != 200) {
      return null;
    }

    RankingResult result = RankingResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.ranking;
    } else {
      return null;
    }
  }

  /// 获取分类
  static Future<StatisticsResult> getBookStatistics() async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_STATISTICS_URL, data: null);
    if (response.statusCode != 200) {
      return null;
    }

    StatisticsResult result =
        StatisticsResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result;
    } else {
      return null;
    }
  }

  /// 获取二级分类
  static Future<CategoryResult> getBookCategory() async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_CATEGORY_URL, data: null);
    if (response.statusCode != 200) {
      return null;
    }

    CategoryResult result = CategoryResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result;
    } else {
      return null;
    }
  }

  /// 关键字搜索返回小说列表
  /// [query] 搜索关键字
  /// [start] 开始位置（从1开始）
  /// [limit] 每页条数
  ///
  static Future<List<Books>> getSearchBook(String query,
      {int start: 1, limit: 20}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL).request(
        ApiUrl.BOOK_SEARCH_URL,
        data: {"query": query, "start": start, "limit": limit});
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.books;
    } else {
      return [];
    }
  }

  /// 搜索热词列表
  ///
  static Future<List<String>> getSearchHotWords() async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_HOT_WORDS_URL, data: null);
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.hotWords;
    } else {
      return [];
    }
  }

  /// 书单列表
  ///
  static Future<List<BookList>> getBookLists(String gender,
      {int start: 0,
      int limit: 20,
      String duration: 'all',
      String sort: 'collectorCount',
      String tag: ''}) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_LIST_URL, data: {
      "gender": gender,
      "duration": duration,
      "sort": sort,
      "tag": tag,
      "start": start,
      "limit": limit
    });
    if (response.statusCode != 200) {
      return [];
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.bookLists;
    } else {
      return [];
    }
  }

  /// 书单详情
  ///
  static Future<BookList> getBookListInfo(String booklistId) async {
    Response response = await HttpUtils(baseUrl: ApiUrl.BOOK_URL)
        .request(ApiUrl.BOOK_LIST_INFO_URL, data: {"booklistId": booklistId});
    if (response.statusCode != 200) {
      return null;
    }

    BookResult result = BookResult.fromMap(json.decode(response.data));
    if (result.ok) {
      return result.bookList;
    } else {
      return null;
    }
  }

  /// 一言
  ///
  static Future<Hitokoto> hitokoto() async {
    Response response =
        await HttpUtils(baseUrl: ApiUrl.HITOKOTO_URL).request('', data: null);
    if (response.statusCode != 200) {
      return null;
    }

    Hitokoto result = Hitokoto.fromMap(json.decode(response.data));
    return result;
  }
}
