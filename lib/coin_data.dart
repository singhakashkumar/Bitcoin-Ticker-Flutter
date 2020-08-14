import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const url = "https://rest.coinapi.io/v1/exchangerate";
const APIKEY = "691DECB2-5739-4358-8ACF-CA2C1F16AF66";

class CoinData {

  Future getCoinData(String selectedCurrency) async{
    String URL="$url/BTC/$selectedCurrency?apikey=$APIKEY";
    http.Response response= await http.get(URL);

    if(response.statusCode == 200){
      var decodedData = jsonDecode(response.body);
      var price = decodedData['rate'];
      return price;
    }else{
      print(response.statusCode);
      throw "Problem fetching the data";
    }

  }
}
