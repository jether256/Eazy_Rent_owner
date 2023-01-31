

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{

  Future<bool> setID(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("ID", id);
  }

  Future<bool> setuser_id(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id",uid);
  }
  Future<bool> setLogo(String logo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("logo", logo);
  }
  Future<bool> setShopim(String shopim) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("shopImage", shopim);
  }

  Future<bool> setBiz(String bizne) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("bizname", bizne);
  }

  Future<bool> setMail(String mail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email1", mail);
  }
  Future<bool> setPhone(String phon) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("phone1", phon);
  }

  Future<bool> setTax(String tax) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("taxRegistered", tax);
  }

  Future<bool> setTin(String tin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("tinNumber", tin);
  }
  Future<bool> setAd(String ad) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("address", ad);
  }
  Future<bool> setLat(String lat) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lat", lat);
  }

  Future<bool> setLon(String lon) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lon", lon);
  }

  Future<bool> setTime(String time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("time1", time);
  }
  Future<bool> setStatus(String sta) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("status1", sta);
  }


  Future<bool> setService(String serve) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("service", serve);
  }

  Future<bool> setOpen(String open) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("shopOpen", open);
  }
  Future<bool> setRating(String rate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("rating", rate);
  }
  Future<bool> setTotal(String total) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("totalRating", total);
  }

  Future<bool> setPicked(String picked) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("isTopPicked", picked);
  }

  Future<bool> setCreate(String create) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("create_t", create);
  }
  Future<bool> setPaid(String paid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("paid", paid);
  }


  Future<bool> setOnline(String online) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("online", online);
  }

  Future<bool> setCod(String cod) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("cod", cod);
  }

  Future<bool> setEnd(String end) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("end", end);
  }
  Future<bool> setRenew(String renu) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("renew", renu);
  }

  Future<bool> setBlocked(String blok) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("blocked", blok);
  }


  ///get


  Future<Object> getID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("ID") ?? '';
  }

  Future<String> getuser_id() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id") ?? '';
  }

  Future<String> getLogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("logo") ?? '';
  }

  Future<String> getShopim() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("shopImage") ?? '';
  }

  Future<String> getBiz() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("bizname") ?? '';
  }

  Future<String> getMail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email1") ?? '';
  }

  Future<String> getPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone1") ?? '';
  }

  Future<String> getTax() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("taxRegistered") ?? '';
  }

  Future<String> getTin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("tinNumber") ?? '';
  }

  Future<String> getAd() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("address") ?? '';
  }

  Future<String> getLat() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lat") ?? '';
  }

  Future<String> getLon() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lon") ?? '';
  }

  Future<String> getTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("time1") ?? '';
  }

  Future<String> getStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("status1") ?? '';
  }

  Future<String> getService() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("service") ?? '';
  }

  Future<String> getOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("shopOpen") ?? '';
  }

  Future<String> getRatig() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("rating") ?? '';
  }

  Future<String> getTotal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("totalRating") ?? '';
  }

  Future<String> getPicked() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("isTopPicked") ?? '';
  }

  Future<String> getCreate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("create_t") ?? '';
  }

  Future<String> getPaid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("paid") ?? '';
  }

  Future<String> getOnline() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("online") ?? '';
  }

  Future<String> getCOD() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("cod") ?? '';
  }

  Future<String> getEnd() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("end") ?? '';
  }

  Future<String> getRenew() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("renew") ?? '';
  }

  Future<String> getBlocked() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("blocked") ?? '';
  }
}