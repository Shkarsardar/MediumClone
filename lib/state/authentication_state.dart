class AutheticationState{
  final bool authenticated;
  AutheticationState.initail({this.authenticated=false});
  AutheticationState.authenticated({this.authenticated=true});
  AutheticationState.failed({this.authenticated=false});
  AutheticationState.signOut({this.authenticated=false});
}