class Student
{

  late String firstName;
  late String lastName;
  late int grade; // not
  late String _status;// ögrencinin dersten gecip gecmedigini ogrenmek icin


///Constructor
  Student.as(this.firstName,this.lastName,this.grade);

  Student.withoutinfo(){}


  /// getter setter

  String? get getFirstName
  {
    return "OGR - $firstName";
  }
  set setFirstName(String value)
  {
    firstName=value;
  }

  String? get getLastName
  {
    return lastName;
  }
  set setLastName(String value)
  {
    setLastName=value;
  }

  int? get getGrade
  {
    return grade;
  }
  set setGrade(int value)
  {
    grade=value;
  }

  String? get getStatus
  {
    String message="";
    if(grade>=50)
    {
      message="Gecti";
    }
    else{
      message="Kaldi";
    }
    return message;
  }
  set setStatus(String value)
  {
    _status=value;
  }

}