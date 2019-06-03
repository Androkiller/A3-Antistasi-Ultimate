
private ["_posHQ"];
_posHQ = getMarkerPos respawnTeamPlayer;

{if ((side group _x == teamPlayer) and (_x distance _posHQ < 50)) then
	{
	if (hasACEMedical) then
		{
		[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHeal;
		}
	else
		{
		if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
		_x setDamage 0;
		};
	}} forEach allUnits;
{
if ((_x distance _posHQ < 150) and (alive _x) and (isNull(attachedTo _x))) then
	{
	_x setDamage 0;
	if (_x getVariable ["INCAPACITATED",false]) then {_x setVariable ["INCAPACITATED",false,true]};
	[_x,1] remoteExec ["setVehicleAmmo",_x];
	};
} forEach vehicles;

hint "Nearby units have been healed. Nearby vehicles have been repaired and rearmed."
