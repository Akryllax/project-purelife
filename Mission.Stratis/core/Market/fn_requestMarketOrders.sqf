/*
	File: fn_requestMarketOrders.sqf
	Author: Akryllax
	Description: Requests to the server aviable market orders and waits.

	Params:
		- Item class - STRING
		- MinAmmount - NUMBER - Minimum ammount in the order. 0 Default
		- MaxAmmount - NUMBER - Maximum ammount in the order. None default.
		- BuyOrders - BOOLEAN - false for SellOrders, true for BuyOrders
		- Limit 0,X - NUMBER - Maximum orders to be fetched.
 */
#define DEFAULT_MAX 1000

_itemClass = param[0,"",[""]];
_minAmmount = param[1,0,[0]];
_maxAmmount = param[2,0,[-1]];
_buyOrder = param[3, false, [false]];
_limitOrders = param[4, 50, [0]];

