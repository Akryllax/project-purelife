class CfgAva {

	class Events {
		class DefaultNotification {
			id = -1;
			type = "notification";
			name = "";
			sound = "";
			values[] = {"Title", "This is a message"};
			duration = 3.5;
		};

		class DefaultNotificationShort : DefaultNotification{
			duration = 2;
		};

		class EventLowAmmo {
			id = 1;
			name = "Low ammo";
			radioClass = "WLowAmmo";
		};
	};
};