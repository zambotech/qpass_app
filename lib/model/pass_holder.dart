class PassHolder {
  String primaryFirstName;
  String primaryMiddleName;
  String primaryLastName;

  String secondaryFirstName;
  String secondaryMiddleName;
  String secondaryLastName;

  String controlNumber;
  String contactNumber;
  Barangay barangay;
  String street;

  String encoder;

  PassHolder (Map<dynamic, dynamic> passholder) {
    this.primaryFirstName = passholder["primary_firstname"] ?? 'N/A';
    this.primaryMiddleName = passholder["primary_middlename"] ?? '';
    this.primaryLastName = passholder["primary_lastname"] ?? 'N/A';

    this.secondaryFirstName = passholder["secondary_firstname"] ?? 'N/A';
    this.secondaryMiddleName = passholder["secondary_middlename"] ?? '';
    this.secondaryLastName = passholder["secondary_lastname"] ?? 'N/A';

    this.controlNumber = passholder["control_number"] ?? 'N/A';
    this.contactNumber = passholder["contact_number"]  ?? 'N/A';
    this.barangay = Barangay(passholder["barangay"]) ?? Map<dynamic, dynamic>();
    this.street = passholder["street"] ?? 'N/A';

    this.encoder = passholder["encoder"] ?? 'N/A';
  }
}

class Barangay {
  int id;
  String name;
  String code;
  String chairman;
  String district;
  String type;

  Barangay (Map<dynamic, dynamic> barangay) {
    this.id = barangay["id"] ?? null;
    this.name = barangay["name"].trim() ?? 'N/A';
    this.code = barangay["code"].trim() ?? 'N/A';
    this.chairman = barangay["chairman"].trim() ?? 'N/A';
    this.district = barangay["district"].trim() ?? 'N/A';
    this.type = barangay["type"].trim() ?? 'N/A';
  }
}