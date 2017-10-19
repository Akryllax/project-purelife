ServerAuthorisation = false;
"ServerAuthorisation" addPublicVariableEventHandler {
	if(_this select 1) then {
		disableUserInput false;
	};
};