/** target frames per second  
    @type Number
*/
var FPS = 30;
/** time between frames 
    @type Number
*/
var SECONDS_BETWEEN_FRAMES = 1000 / FPS;
/** A global reference to the GameObjectManager instance  
    @type GameObjectManager
*/
var g_GameObjectManager = null;
/** An image to be used by the application  
    @type Image
*/
var g_image = new Image();
g_image.src = "images/bird2.png";
var g_image2 = new Image();
g_image2.src = "images/block.png";

var g_bgImage = new Image();
g_bgImage.src = "images/bg.png";

var g_timer = null;

var g_sprites = new SpriteSheet({
	//height:32,
	//width:32,
	/*
	sprites : [ {
		name : "brid_1",
		x : 824,
		y : 262,
		w : 30,
		h : 29
	}, {
		name : "brid_2",
		x : 824,
		y : 295,
		w : 30,
		h : 29
	}, {
		name : "brid_3",
		x : 824,
		y : 329,
		w : 30,
		h : 28
	} ]*/
sprites : [ {
	name : "bird_1",
	x : 1,
	y : 379,
	w : 31,
	h : 30
}, {
	name : "bird_2",
	x : 1,
	y : 411,
	w : 31,
	h : 30
}, {
	name : "bird_3",
	x : 1,
	y : 508,
	w : 30,
	h : 28
} , {
	name : "bird_4",
	x : 1,
	y : 538,
	w : 30,
	h : 29
} , {
	name : "slingshot_1",
	x : 1,
	y : 1,
	w : 38,
	h : 199
} , {
	name : "slingshot_2",
	x : 833,
	y : 1,
	w : 43,
	h : 124
} , {
	name : "wood_1",
	x : 665,
	y : 635,
	w : 168,
	h : 20
} , {
	name : "wood_2",
	x : 835,
	y : 657,
	w : 168,
	h : 20
} , {
	name : "wood_3",
	x : 495,
	y : 613,
	w : 168,
	h : 20
} , {
	name : "wood_4",
	x : 665,
	y : 635,
	w : 168,
	h : 20
} , {
	name : "wood_5",
	x : 665,
	y : 701,
	w : 168,
	h : 20
} , {
	name : "glass_1",
	x : 665,
	y : 612,
	w : 168,
	h : 20
} , {
	name : "glass_2",
	x : 835,
	y : 635,
	w : 168,
	h : 20
} , {
	name : "glass_3",
	x : 495,
	y : 635,
	w : 168,
	h : 20
} , {
	name : "glass_4",
	x : 665,
	y : 679,
	w : 168,
	h : 20
} , {
	name : "glass_5",
	x : 835,
	y : 701,
	w : 168,
	h : 20
} , {
	name : "glass_6",
	x : 495,
	y : 701,
	w : 168,
	h : 20
} , {
	name : "stone_1",
	x : 495,
	y : 723,
	w : 168,
	h : 20
} , {
	name : "stone_2",
	x : 495,
	y : 789,
	w : 168,
	h : 20
} , {
	name : "stone_3",
	x : 665,
	y : 657,
	w : 168,
	h : 20
} , {
	name : "stone_4",
	x : 495,
	y : 591,
	w : 168,
	h : 20
} , {
	name : "stone_5",
	x : 495,
	y : 657,
	w : 168,
	h : 20
} , {
	name : "pig_1",
	x : 41,
	y : 1,
	w : 126,
	h : 153
} , {
	name : "pig_2",
	x : 169,
	y : 1,
	w : 126,
	h : 153
} , {
	name : "pig_3",
	x : 297,
	y : 1,
	w : 126,
	h : 153
} , {
	name : "pig_4",
	x : 425,
	y : 1,
	w : 126,
	h : 153
} ]
});

var g_animations = [];
g_animations["bird1"] = new Animation([ {
	sprite : 'bird_1',
	time : 0.2
}, {
	sprite : 'bird_2',
	time : 0.2
}, {
	sprite : 'bird_3',
	time : 0.2
}, {
	sprite : 'bird_4',
	time : 0.2
} ], g_sprites);
g_animations["bird2"] = new Animation([ {
	sprite : 'bird_3',
	time : 0.2
}, {
	sprite : 'bird_2',
	time : 0.2
}, {
	sprite : 'bird_1',
	time : 0.2
} ], g_sprites);
g_animations["wood1"] = new Animation([ {
	sprite : 'wood_1',
	time : 0.2/*
}, {
	sprite : 'wood_2',
	time : 0.2
}, {
	sprite : 'wood_3',
	time : 0.2
}, {
	sprite : 'wood_4',
	time : 0.2
}, {
	sprite : 'wood_5',
	time : 0.2*/
} ], g_sprites);
g_animations["glass1"] = new Animation([ {
	sprite : 'glass_1',
	time : 0.2/*
}, {
	sprite : 'glass_2',
	time : 0.2
}, {
	sprite : 'glass_3',
	time : 0.2
}, {
	sprite : 'glass_4',
	time : 0.2
}, {
	sprite : 'glass_5',
	time : 0.2*/
} ], g_sprites);
g_animations["stone1"] = new Animation([ {
	sprite : 'stone_1',
	time : 0.2 /*
}, {
	sprite : 'stone_2',
	time : 0.2
}, {
	sprite : 'stone_3',
	time : 0.2
}, {
	sprite : 'stone_4',
	time : 0.2
}, {
	sprite : 'stone_5',
	time : 0.2*/
} ], g_sprites);
g_animations["pig1"] = new Animation([ {
	sprite : 'pig_1',
	time : 0.2 
}, {
	sprite : 'pig_2',
	time : 0.2
}, {
	sprite : 'pig_3',
	time : 0.2
}, {
	sprite : 'pig_4',
	time : 0.2
} ], g_sprites);

var g_pressedKeys = [];
var g_mouse = {};

// The entry point of the application is set to the init function
window.onload = init;

/**
    Application entry point
*/
function init()
{
    new GameObjectManager().startupGameObjectManager();
}