class ApiSetting {
  static const _baseUrl = "http://events.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";
  static const login = _apiUrl + 'auth/login';
  static const logout = _apiUrl + 'auth/logout';



  static const categories = _apiUrl + 'categories';

  static const creatEvent = _apiUrl + 'events';
  static const eventDetails = _apiUrl + 'events/12';
  static const updateEvent = _apiUrl + 'events/2';
  static const deleteEvent = _apiUrl + 'events/14';
  static const showEvent = _apiUrl + 'categories/1';
}