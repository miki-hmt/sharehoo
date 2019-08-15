/**
    A test class to demonstrate the use of the VisualGameObject class
    @author <a href="mailto:matthewcasperson@gmail.com">Matthew Casperson</a>
    @class
*/
var KEY = {
    LEFT: 37,
    UP: 38,
    RIGHT: 39,
    DOWN: 40,
    W: 87,
    S: 83
};
function Boxer()
{
	/** The movement direction  in the x axis
        @type Number
    */
	this.xDirection = 1;
	/** The movement direction  in the x axis
        @type Number
    */
	this.yDirection = 1;
	/** The movement speed
        @type Number
    */
	this.speed = 50;
	
	this.createPunch = function()
	{
		this.punch = new Animation([
                    { sprite: 'punch_1', time: 0.2 },
                    { sprite: 'punch_2', time: 0.2 },
                    { sprite: 'punch_3', time: 0.2 },
            ], this.sprites);
		return this.punch;
	};
	this.createWalk = function()
	{
		this.walk = new Animation([
                    { sprite: 'walk_1', time: 0.2 },
                    { sprite: 'stand', time: 0.2 },
                    { sprite: 'walk_2', time: 0.2 },
                    { sprite: 'stand', time: 0.2 }
            ], this.sprites);
		return this.walk;
	};
	
	/**
        Initialises this object
        @return A reference to the initialised object
    */
	this.startupBoxer = function(image)
	{
		this.sprites = new SpriteSheet({
                width: 32,
                height: 32,
                sprites: [
                    { name: 'stand' , x: 0, y: 0},
                    { name: 'walk_1', x: 1*32, y: 0 },
                    { name: 'walk_2', x: 2*32, y: 0 },
                    { name: 'run', x: 3*32, y: 0 },
                    { name: 'jump', x: 4*32, y: 0 },
                    { name: 'punch_1', x: 5*32, y: 0 },
                    { name: 'punch_2', x: 6*32, y: 0 },
                    { name: 'punch_3', x: 7*32, y: 0 },
                    { name: 'die_1', x: 0, y: 1*32 },
                    { name: 'die_2', x: 1*32, y: 1*32 },
                    { name: 'die_3', x: 2*32, y: 1*32 },
                ]
            });
		
		this.currentAction = this.createWalk();
		this.createPunch();
		
		// use my own image
		var img = new Image();
		img.src = "images/kunio.gif";
		
		this.startupVisualGameObject(img, 0, 0, 0);		
		return this;
	};
	
	/**
        Updates the object
        @param dt The time since the last frame in seconds
        @param context The drawing context 
        @param xScroll The global scrolling value of the x axis  
        @param yScroll The global scrolling value of the y axis 
    */	
	this.update = function (/**Number*/ dt, /**CanvasRenderingContext2D*/context, /**Number*/ xScroll, /**Number*/ yScroll)
	{
		//this.x += dt * this.speed * this.xDirection;
		//this.y += dt * this.speed * this.yDirection;
		if(g_pressedKeys[KEY.W])
		{
			//if(this.currentAction is this.punch)
			{
				this.currentAction = this.punch; 
			}
		}
		else
		{
				this.currentAction = this.walk; 
		}
		
		if(g_pressedKeys[KEY.UP])
		{
			this.y -= dt * this.speed;
		}
		if(g_pressedKeys[KEY.DOWN])
		{
			this.y += dt * this.speed;
		}
		
		if(g_pressedKeys[KEY.LEFT])
		{
			this.x -= dt * this.speed;
		}
		if(g_pressedKeys[KEY.RIGHT])
		{
			this.x += dt * this.speed;
		}
		
		if (this.x >= 450)
		{
			this.x = 450;
			//this.xDirection = -1;
		}
		else if (this.x <= 0)
		{
			this.x = 0;
			//this.xDirection = 1;
		}
		
		if (this.y >= 250)
		{
			this.y = 250;
			//this.yDirection = -1;
		}
		else if (this.y <= 0)
		{
			this.y = 0;
			//this.yDirection = 1;
		}
		//this.walk.animate(dt);
		//this.punch.animate(dt);
		this.currentAction.animate(dt);
	};
	this.draw = function(/**Number*/ dt, /**CanvasRenderingContext2D*/ context, /**Number*/ xScroll, /**Number*/ yScroll)
    {
		var frame = this.currentAction.getSprite();
		context.drawImage(this.image, frame.x, frame.y, frame.w, frame.h, this.x - xScroll, this.y - yScroll, frame.w, frame.h);
    };
}
Boxer.prototype = new VisualGameObject;