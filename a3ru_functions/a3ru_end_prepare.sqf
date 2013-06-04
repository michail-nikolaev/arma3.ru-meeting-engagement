// End prepare time
a3ru_started = true;
publicVariable "a3ru_started";
[] spawn fnc_a3ru_started;
[format["Admin %1 started the game!", name player], 0] call fnc_a3ru_message;