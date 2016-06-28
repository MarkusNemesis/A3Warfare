[] spawn {
	Run = false;
		waituntil {
		_size = sizeOf typeof player;
		_points = [[-5,5,0],[5,5,0],[5,-5,0],[-5,-5,0],[-5,5,5],[5,5,5],[5,-5,5],[-5,-5,5]];
		{
			private ["_posS","_posE"];
			_posS = player modelToWorld _x;
			if (_foreachIndex == (count _points)-1) then {
				_posE = player modelToWorld (_points select 0);
			} else {
				_posE = player modelToWorld (_points select (_foreachIndex + 1));
			};
			
			drawLine3D [_posS,_posE,[1,0,0,1]];
		} foreach _points;
		Run
	};
};

[] spawn {
	Run = false;
		waituntil {
		_size = sizeOf typeof player;
		_points = [[-1,1,0],[1,1,0],[1,-1,0],[-1,-1,0],[-1,1,1],[1,1,1],[1,-1,1],[-1,-1,1]];
		_vMul = 0.5;
		{
			private ["_posS","_posE"];
			_posS = player modelToWorld (_x vectorMultiply _vMul);
			{
				_posE = player modelToWorld (_x vectorMultiply _vMul);
				
				drawLine3D [_posS,_posE,[1,0,0,1]];
			} foreach _points;
		} foreach _points;
		Run
	};
};

[] spawn {
	Run = true;
	sleep 0.5;
	Run = false;
	waitUntil {
		private ["_vMul","_object","_points"];
		_vMul = 5;
		_object = player;
		_points = [
		[[-0.5,0.5,0],[0.5,0.5,0]],
		[[0.5,0.5,0],[0.5,-0.5,0]],
		[[0.5,-0.5,0],[-0.5,-0.5,0]],
		[[-0.5,-0.5,0],[-0.5,0.5,0]],

		[[-0.5,0.5,0],[-0.5,0.5,1]],
		[[0.5,0.5,0],[0.5,0.5,1]],
		[[0.5,-0.5,0],[0.5,-0.5,1]],
		[[-0.5,-0.5,0],[-0.5,-0.5,1]],

		[[-0.5,0.5,1],[0.5,0.5,1]],
		[[0.5,0.5,1],[0.5,-0.5,1]],
		[[0.5,-0.5,1],[-0.5,-0.5,1]],
		[[-0.5,-0.5,1],[-0.5,0.5,1]]
		];
				
		{
			private ["_posS","_posE"];
			_posS = player modelToWorld ((_x select 0) vectorMultiply _vMul);
			_posE = player modelToWorld ((_x select 1) vectorMultiply _vMul);
			
			drawLine3D [_posS,_posE,[1,0,0,1]];
		} foreach _points;
		
		_points = [
		[[0,_vMul + 5,0],[0,_vMul + 6,0]],
		[[0,_vMul + 6,0],[0.5,_vMul + 5.5,0]],
		[[0,_vMul + 6,0],[-0.5,_vMul + 5.5,0]]
		];
		
		{
			private ["_posS","_posE"];
			_posS = player modelToWorld (_x select 0);
			_posE = player modelToWorld (_x select 1);
			
			drawLine3D [_posS,_posE,[1,0,0,1]];
		} foreach _points;
		
		Run
	};
};


/* Array of point-points
[
// Draw the base square
[[-0.5,0.5,0],[0.5,0.5,0]],
[[0.5,0.5,0],[0.5,-0.5,0]],
[[0.5,-0.5,0],[-0.5,-0.5,0]],
[[-0.5,-0.5,0],[-0.5,0.5,0]],
// Draw the verticals
[[-0.5,0.5,0],[-0.5,0.5,1]],
[[0.5,0.5,0],[0.5,0.5,1]],
[[0.5,-0.5,0],[0.5,-0.5,1]],
[[-0.5,-0.5,0],[-0.5,-0.5,1]],
// Draw the top square
[[-0.5,0.5,1],[0.5,0.5,1]],
[[0.5,0.5,1],[0.5,-0.5,1]],
[[0.5,-0.5,1],[-0.5,-0.5,1]],
[[-0.5,-0.5,1],[-0.5,0.5,1]]
];

// Draw the "front" arrow
[
[[0,5,0],[0,6,0]],
[[0,6,0],[0.5,5.5,0]],
[[0,6,0],[-0.5,5.5,0]]
];
*/

/*
Define the array of points to be rendered.
[-5,5,0] - Front Left Lower
[5,5,0] - Front Right Lower
[5,-5,0] - Rear Right Lower
[-5,-5,0] - Rear Left Lower

[-5,5,5] - Front Left Upper
[5,5,5] - Front Right Upper
[5,-5,5] - Rear Right Upper
[-5,-5,5] - Rear Left Upper
*/