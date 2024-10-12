class WeatherModel {
  static final Map<String, String> weatherIcons = {
    'not_available': 'assets/icons/not-available.png', //1
    'sunny': 'assets/icons/sunny.png', //2
    'mostly_sunny': 'assets/icons/mostly-sunny.png', //3
    'partly_sunny': 'assets/icons/partly-sunny.png', //4
    'mostly_cloudy': 'assets/icons/mostly-cloudy.png', //5
    'cloudy': 'assets/icons/cloudy.png', //6
    'overcast': 'assets/icons/overcast.png', //7
    'overcast_w_low_clds': 'assets/icons/overcast-with-low-clouds.png', //8
    'fog': 'assets/icons/fog.png', //9
    'light_rain': 'assets/icons/light-rain.png', //10
    'rain': 'assets/icons/rain.png', //11
    'psbl_rain': 'assets/icons/possible-rain.png', //12
    'rain_shower': 'assets/icons/rain-shower.png', //13
    'tstorm': 'assets/icons/thunderstorm.png', //14
    'tstorm_shower': 'assets/icons/local-thunderstorms.png', //15
    'light_snow': 'assets/icons/light-snow.png', //16
    'snow': 'assets/icons/snow.png', //17
    'psbl_snow': 'assets/icons/possible-snow.png', //18
    'snow_shower': 'assets/icons/snow-shower.png', //19
    'rain_and_snow': 'assets/icons/rain-and-snow.png', //20
    'psbl_rain_and_snow': 'assets/icons/possible-rain-and-snow.png', //21
    //'rain_and_snow': 'assets/icons/rain-and-snow.png',  //22
    'fr_rain': 'assets/icons/freezing-rain.png', //23
    'psbl_fr_rain': 'assets/icons/possible-freezing-rain.png', //24
    'hail': 'assets/icons/hail.png', //25
    'clear': 'assets/icons/clear-night.png', //26
    'mostly_clear': 'assets/icons/mostly-clear-night.png', //27
    'partly_clear': 'assets/icons/partly-cloudy-night.png', //28
    'mostly_cloudy_night': 'assets/icons/mostly-cloudy-night.png', //29
    'cloudy_night': 'assets/icons/cloudy-night.png', //30
    'overcast_with_low_clouds_night':
        'assets/icons/overcast-with-low-clouds-night.png', //31

    'local_thunderstorms_night':
        'assets/icons/local-thunderstorms-night.png', //32
    'snow_shower_night': 'assets/icons/snow-shower-night.png', //33
    'rain_and_snow_night': 'assets/icons/rain-and-snow-night.png', //34
  };

  static final Map<String, String> translateWeather = {
    'not_available': 'Não disponível',
    'sunny': 'Ensolarado',
    'mostly_sunny': 'Principalmente ensolarado',
    'partly_sunny': 'Parcialmente ensolarado',
    'mostly_cloudy': 'Principalmente nublado',
    'cloudy': 'Nublado',
    'overcast': 'Encoberto',
    'overcast_w_low_clds': 'Encoberto com nuvens baixas',
    'fog': 'Neblina',
    'light_rain': 'Chuva leve',
    'rain': 'Chuva',
    'psbl_rain': 'Possibilidade de chuva',
    'rain_shower': 'Chuva de banho',
    'tstorm': 'Tempestade',
    'tstorm_shower': 'Tempestade local',
    'light_snow': 'Neve leve',
    'snow': 'Neve',
    'psbl_snow': 'Possibilidade de neve',
    'snow_shower': 'Neve de banho',
    'rain_and_snow': 'Chuva e neve',
    'psbl_rain_and_snow': 'Possibilidade de chuva e neve',
    'fr_rain': 'Chuva congelante',
    'psbl_fr_rain': 'Possibilidade de chuva congelante',
    'hail': 'Granizo',
    'clear': 'Céu limpo',
    'mostly_clear': 'Principalmente limpo',
    'partly_clear': 'Parcialmente nublado',
    'mostly_cloudy_night': 'Principalmente nublado',
    'cloudy_night': 'Nublado',
    'overcast_with_low_clouds_night': 'Encoberto com nuvens baixas',
    'local_thunderstorms_night': 'Tempestades locais',
    'snow_shower_night': 'Neve de banho',
    'rain_and_snow_night': 'Chuva e neve',
  };

  static String getWeatherTranslation(String weather) {
    return translateWeather[weather] ?? 'Não disponível';
  }

  static String getWeatherIcon(String weather) {
    return weatherIcons[weather] ?? 'assets/icons/not-available.png';
  }
}
