
bool isMail(String mail){

  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail)){
    return false;
  }else{
  return true;}
}

bool isCPF(String cpf){
  if (cpf.length == 11){
    return true;
  }
  return false;
}

bool isDate(String date){

  return false;
}