params [
	_name,
	_wallet_cash,
	_bank_accounts
];

missionNamespace setVariable ["playerUsername", _name];
missionNamespace setVariable ["playerWallet", _wallet_cash];
missionNamespace setVariable ["playerBankAccounts", _bank_accounts];