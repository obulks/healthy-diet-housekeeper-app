class FoodList {
  int code;
  String msg;
  Data data;

  FoodList({this.code, this.msg, this.data});

  FoodList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String page;
  List<Foods> foods;

  Data({this.page, this.foods});

  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['foods'] != null) {
      foods = new List<Foods>();
      json['foods'].forEach((v) {
        foods.add(new Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foods {
  String name;
  num rl;
  num las;
  num gai;
  num dbz;
  num su;
  num mei;
  num zf;
  num ys;
  num tei;
  num shhf;
  num wsfc;
  num meng;
  num ssxw;
  num wsse;
  num xin;
  num wssa;
  num dgc;
  num tong;
  num lb;
  num jia;
  num ling;
  num shc;
  num la;
  num xi;
  String type;

  Foods(
      {this.name,
        this.rl,
        this.las,
        this.gai,
        this.dbz,
        this.su,
        this.mei,
        this.zf,
        this.ys,
        this.tei,
        this.shhf,
        this.wsfc,
        this.meng,
        this.ssxw,
        this.wsse,
        this.xin,
        this.wssa,
        this.dgc,
        this.tong,
        this.lb,
        this.jia,
        this.ling,
        this.shc,
        this.la,
        this.xi,
        this.type});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rl = json['rl'];
    las = json['las'];
    gai = json['gai'];
    dbz = json['dbz'];
    su = json['su'];
    mei = json['mei'];
    zf = json['zf'];
    ys = json['ys'];
    tei = json['tei'];
    shhf = json['shhf'];
    wsfc = json['wsfc'];
    meng = json['meng'];
    ssxw = json['ssxw'];
    wsse = json['wsse'];
    xin = json['xin'];
    wssa = json['wssa'];
    dgc = json['dgc'];
    tong = json['tong'];
    lb = json['lb'];
    jia = json['jia'];
    ling = json['ling'];
    shc = json['shc'];
    la = json['la'];
    xi = json['xi'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rl'] = this.rl;
    data['las'] = this.las;
    data['gai'] = this.gai;
    data['dbz'] = this.dbz;
    data['su'] = this.su;
    data['mei'] = this.mei;
    data['zf'] = this.zf;
    data['ys'] = this.ys;
    data['tei'] = this.tei;
    data['shhf'] = this.shhf;
    data['wsfc'] = this.wsfc;
    data['meng'] = this.meng;
    data['ssxw'] = this.ssxw;
    data['wsse'] = this.wsse;
    data['xin'] = this.xin;
    data['wssa'] = this.wssa;
    data['dgc'] = this.dgc;
    data['tong'] = this.tong;
    data['lb'] = this.lb;
    data['jia'] = this.jia;
    data['ling'] = this.ling;
    data['shc'] = this.shc;
    data['la'] = this.la;
    data['xi'] = this.xi;
    data['type'] = this.type;
    return data;
  }
}
