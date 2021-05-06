class AllDataResponse {
  List<CasesTimeSeries> casesTimeSeries;
  List<Statewise> statewise;
  List<Tested> tested;

  AllDataResponse({this.casesTimeSeries, this.statewise, this.tested});

  AllDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['cases_time_series'] != null) {
      casesTimeSeries = new List<CasesTimeSeries>();
      json['cases_time_series'].forEach((v) {
        casesTimeSeries.add(new CasesTimeSeries.fromJson(v));
      });
    }
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
    if (json['tested'] != null) {
      tested = new List<Tested>();
      json['tested'].forEach((v) {
        tested.add(new Tested.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.casesTimeSeries != null) {
      data['cases_time_series'] =
          this.casesTimeSeries.map((v) => v.toJson()).toList();
    }
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    if (this.tested != null) {
      data['tested'] = this.tested.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CasesTimeSeries {
  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  String dateymd;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  CasesTimeSeries(
      {this.dailyconfirmed,
        this.dailydeceased,
        this.dailyrecovered,
        this.date,
        this.dateymd,
        this.totalconfirmed,
        this.totaldeceased,
        this.totalrecovered});

  CasesTimeSeries.fromJson(Map<String, dynamic> json) {
    dailyconfirmed = json['dailyconfirmed'];
    dailydeceased = json['dailydeceased'];
    dailyrecovered = json['dailyrecovered'];
    date = json['date'];
    dateymd = json['dateymd'];
    totalconfirmed = json['totalconfirmed'];
    totaldeceased = json['totaldeceased'];
    totalrecovered = json['totalrecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyconfirmed'] = this.dailyconfirmed;
    data['dailydeceased'] = this.dailydeceased;
    data['dailyrecovered'] = this.dailyrecovered;
    data['date'] = this.date;
    data['dateymd'] = this.dateymd;
    data['totalconfirmed'] = this.totalconfirmed;
    data['totaldeceased'] = this.totaldeceased;
    data['totalrecovered'] = this.totalrecovered;
    return data;
  }
}

class Statewise {
  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  Statewise(
      {this.active,
        this.confirmed,
        this.deaths,
        this.deltaconfirmed,
        this.deltadeaths,
        this.deltarecovered,
        this.lastupdatedtime,
        this.migratedother,
        this.recovered,
        this.state,
        this.statecode,
        this.statenotes});

  Statewise.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    deltaconfirmed = json['deltaconfirmed'];
    deltadeaths = json['deltadeaths'];
    deltarecovered = json['deltarecovered'];
    lastupdatedtime = json['lastupdatedtime'];
    migratedother = json['migratedother'];
    recovered = json['recovered'];
    state = json['state'];
    statecode = json['statecode'];
    statenotes = json['statenotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['deltaconfirmed'] = this.deltaconfirmed;
    data['deltadeaths'] = this.deltadeaths;
    data['deltarecovered'] = this.deltarecovered;
    data['lastupdatedtime'] = this.lastupdatedtime;
    data['migratedother'] = this.migratedother;
    data['recovered'] = this.recovered;
    data['state'] = this.state;
    data['statecode'] = this.statecode;
    data['statenotes'] = this.statenotes;
    return data;
  }
}

class Tested {
  String dailyrtpcrsamplescollectedicmrapplication;
  String firstdoseadministered;
  String frontlineworkersvaccinated1stdose;
  String frontlineworkersvaccinated2nddose;
  String healthcareworkersvaccinated1stdose;
  String healthcareworkersvaccinated2nddose;
  String over45years1stdose;
  String over45years2nddose;
  String over60years1stdose;
  String over60years2nddose;
  String positivecasesfromsamplesreported;
  String registrationflwhcw;
  String registrationonline;
  String registrationonspot;
  String samplereportedtoday;
  String seconddoseadministered;
  String source;
  String source2;
  String source3;
  String source4;
  String testedasof;
  String testsconductedbyprivatelabs;
  String to60yearswithcoMorbidities1stdose;
  String to60yearswithcoMorbidities2nddose;
  String totaldosesadministered;
  String totalindividualsregistered;
  String totalindividualstested;
  String totalindividualsvaccinated;
  String totalpositivecases;
  String totalrtpcrsamplescollectedicmrapplication;
  String totalsamplestested;
  String totalsessionsconducted;
  String updatetimestamp;
  String years1stdose;

  Tested(
      {this.dailyrtpcrsamplescollectedicmrapplication,
        this.firstdoseadministered,
        this.frontlineworkersvaccinated1stdose,
        this.frontlineworkersvaccinated2nddose,
        this.healthcareworkersvaccinated1stdose,
        this.healthcareworkersvaccinated2nddose,
        this.over45years1stdose,
        this.over45years2nddose,
        this.over60years1stdose,
        this.over60years2nddose,
        this.positivecasesfromsamplesreported,
        this.registrationflwhcw,
        this.registrationonline,
        this.registrationonspot,
        this.samplereportedtoday,
        this.seconddoseadministered,
        this.source,
        this.source2,
        this.source3,
        this.source4,
        this.testedasof,
        this.testsconductedbyprivatelabs,
        this.to60yearswithcoMorbidities1stdose,
        this.to60yearswithcoMorbidities2nddose,
        this.totaldosesadministered,
        this.totalindividualsregistered,
        this.totalindividualstested,
        this.totalindividualsvaccinated,
        this.totalpositivecases,
        this.totalrtpcrsamplescollectedicmrapplication,
        this.totalsamplestested,
        this.totalsessionsconducted,
        this.updatetimestamp,
        this.years1stdose});

  Tested.fromJson(Map<String, dynamic> json) {
    dailyrtpcrsamplescollectedicmrapplication =
    json['dailyrtpcrsamplescollectedicmrapplication'];
    firstdoseadministered = json['firstdoseadministered'];
    frontlineworkersvaccinated1stdose =
    json['frontlineworkersvaccinated1stdose'];
    frontlineworkersvaccinated2nddose =
    json['frontlineworkersvaccinated2nddose'];
    healthcareworkersvaccinated1stdose =
    json['healthcareworkersvaccinated1stdose'];
    healthcareworkersvaccinated2nddose =
    json['healthcareworkersvaccinated2nddose'];
    over45years1stdose = json['over45years1stdose'];
    over45years2nddose = json['over45years2nddose'];
    over60years1stdose = json['over60years1stdose'];
    over60years2nddose = json['over60years2nddose'];
    positivecasesfromsamplesreported = json['positivecasesfromsamplesreported'];
    registrationflwhcw = json['registrationflwhcw'];
    registrationonline = json['registrationonline'];
    registrationonspot = json['registrationonspot'];
    samplereportedtoday = json['samplereportedtoday'];
    seconddoseadministered = json['seconddoseadministered'];
    source = json['source'];
    source2 = json['source2'];
    source3 = json['source3'];
    source4 = json['source4'];
    testedasof = json['testedasof'];
    testsconductedbyprivatelabs = json['testsconductedbyprivatelabs'];
    to60yearswithcoMorbidities1stdose =
    json['to60yearswithco-morbidities1stdose'];
    to60yearswithcoMorbidities2nddose =
    json['to60yearswithco-morbidities2nddose'];
    totaldosesadministered = json['totaldosesadministered'];
    totalindividualsregistered = json['totalindividualsregistered'];
    totalindividualstested = json['totalindividualstested'];
    totalindividualsvaccinated = json['totalindividualsvaccinated'];
    totalpositivecases = json['totalpositivecases'];
    totalrtpcrsamplescollectedicmrapplication =
    json['totalrtpcrsamplescollectedicmrapplication'];
    totalsamplestested = json['totalsamplestested'];
    totalsessionsconducted = json['totalsessionsconducted'];
    updatetimestamp = json['updatetimestamp'];
    years1stdose = json['years1stdose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyrtpcrsamplescollectedicmrapplication'] =
        this.dailyrtpcrsamplescollectedicmrapplication;
    data['firstdoseadministered'] = this.firstdoseadministered;
    data['frontlineworkersvaccinated1stdose'] =
        this.frontlineworkersvaccinated1stdose;
    data['frontlineworkersvaccinated2nddose'] =
        this.frontlineworkersvaccinated2nddose;
    data['healthcareworkersvaccinated1stdose'] =
        this.healthcareworkersvaccinated1stdose;
    data['healthcareworkersvaccinated2nddose'] =
        this.healthcareworkersvaccinated2nddose;
    data['over45years1stdose'] = this.over45years1stdose;
    data['over45years2nddose'] = this.over45years2nddose;
    data['over60years1stdose'] = this.over60years1stdose;
    data['over60years2nddose'] = this.over60years2nddose;
    data['positivecasesfromsamplesreported'] =
        this.positivecasesfromsamplesreported;
    data['registrationflwhcw'] = this.registrationflwhcw;
    data['registrationonline'] = this.registrationonline;
    data['registrationonspot'] = this.registrationonspot;
    data['samplereportedtoday'] = this.samplereportedtoday;
    data['seconddoseadministered'] = this.seconddoseadministered;
    data['source'] = this.source;
    data['source2'] = this.source2;
    data['source3'] = this.source3;
    data['source4'] = this.source4;
    data['testedasof'] = this.testedasof;
    data['testsconductedbyprivatelabs'] = this.testsconductedbyprivatelabs;
    data['to60yearswithco-morbidities1stdose'] =
        this.to60yearswithcoMorbidities1stdose;
    data['to60yearswithco-morbidities2nddose'] =
        this.to60yearswithcoMorbidities2nddose;
    data['totaldosesadministered'] = this.totaldosesadministered;
    data['totalindividualsregistered'] = this.totalindividualsregistered;
    data['totalindividualstested'] = this.totalindividualstested;
    data['totalindividualsvaccinated'] = this.totalindividualsvaccinated;
    data['totalpositivecases'] = this.totalpositivecases;
    data['totalrtpcrsamplescollectedicmrapplication'] =
        this.totalrtpcrsamplescollectedicmrapplication;
    data['totalsamplestested'] = this.totalsamplestested;
    data['totalsessionsconducted'] = this.totalsessionsconducted;
    data['updatetimestamp'] = this.updatetimestamp;
    data['years1stdose'] = this.years1stdose;
    return data;
  }
}
