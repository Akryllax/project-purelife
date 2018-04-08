/*
	File: CfgEvents.h
	Author: Akryllax
	Description: Describes the posible events that can be created in the 
	framework as well as their managers.

 */
class CfgEvents {
	class DefaultEvent {
		id=-1;
		priority=0;
		name="DefaultEvent";
		sound="DefaultNotification";
		icon="";

		//Called before
		onStarted="PL_fnc_eventProcess";
		//Call after processed
		onFinished="";

		values[]={{"title", "Defalut Event"},{"msg", "This is a default event"}};
	};

	class RecieveSMSStandard : DefaultEvent {

	};
};