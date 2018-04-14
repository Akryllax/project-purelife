diag_log "SERVER INITIALIZING";

// Initialize the Database
diag_log "Connecting to Database";
["arma3_test", "SQL_CUSTOM", "purelife"] call DB_fnc_initialize;