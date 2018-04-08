/*
	File: fn_arrayInsertInto.sqf
	Author: Akryllax
	Description: Insert an element into an array at the given index.
 */

_array = param [0, [], []];
_element = _this select 1;
_index = param [2, -1,[]];

if(_index < 0) exitWith {
	_array;
};

if(count _array == 0) exitWith {
	[_element];
};

_result = [];

if(_index > 0) then {
	_arrA = _array select [0, _index - 1];
	_arrB = _array select [_index, (count _array) - 1];

	_result = (_arrA append [_element]) append _arrB;
} else {
	_result = [_element] append _array;
}

_result