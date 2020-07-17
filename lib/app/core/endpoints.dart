class ApiEndpoints {


  //static const String MAIN_URL = 'http://10.0.3.2:8000/api/v1';

  static const String MAIN_URL = 'https://agile-thicket-78858.herokuapp.com/api/v1';

  static const String LOGIN_URL = '/login';

  static const String LOGOUT_URL = '/logout';

  static const String CLIENTS_URL = '/clients';

  static const String REGISTERS_URL = '/registers';

  static const String REGISTERS_DONE = '/registers/user';

  static const String CURRENT_USER_INFO = '/currentUser/info';

  static const String SEARCHED_CLIENT_INFO = '/search/clients';

  static const String SEARCH_CLIENT_NAME = '/search/client';

  static const String REFRESH_TOKEN = '/refresh';

  static const String CONTACTS_TODO_TODAY = '/registers/user/today/1';

  static const String CONTACTS_DONE_TODAY = '/registers/user/contactsDone/today';

  static const String CONTACTS_DONE_BY_USER_SPECIFIC_DAY = '/registers/user/contacts/day';

  static const String PRODUCTS_URL = '/products';

  static const String PRODUCTS_ACTIVE = '/products/active';

  static const String PRODUCT_PRICE = '/product/price';

  static const String CLIENTS_WITHOUT_CONTACTS = '/clients/withoutContact';

  static const String CLIENTS_WITHOUT_PURCHASE = '/clients/withoutPurchase';

  static const String CLIENTS_SPENT_MORE = '/clients/spentMore';

  static const String PRODUCT_EFICIENCY = '/product/efective/efficiency';

  static const String PRODUCT_PENDING_EFICIENCY = '/product/pending/efficiency';

  static const String PRODUCT_LOST_EFICIENCY = '/product/lost/efficiency';

  static const String ENTERPRISE_REPORT = '/register/report';

  static const String FULL_REPORT_ACTIVE = '/register/report/active';

  static const String FULL_REPORT_EXTERNAL = '/register/report/external';

  static const String FULL_REPORT_RECEIVED = '/register/report/received';

  static const String FULL_REPORT_balcony = '/register/report/balcony';

  static const String USER_REPORT = '/register/report/user';

  static const String USER_URL = '/users';

  static const String USER_INFO = '/user/info';
}