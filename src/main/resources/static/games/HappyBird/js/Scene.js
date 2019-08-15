function Scene() {

	this.canvasWidth = g_GameObjectManager.canvas.width;
	this.canvasHeight = g_GameObjectManager.canvas.height;
	
	this.audios={};
	
	this.currentLevel = 1;
	this.levelClear = false;
	this.levels = new Array();
	this.levels[0] = [{
		id : "ground",
		x : this.canvasWidth / 2 / SCALE,
		y : this.canvasHeight / SCALE,
		halfHeight : 1,
		halfWidth : this.canvasWidth  / SCALE,
		color : 'yellow'
	}, {
		id : "b1",
		x : 17,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "target",
		x : 18.9,
		y : this.canvasHeight / SCALE - 1.5,
		radius : 0.5,
		strength : 20,
		animation: g_animations["pig1"],
		image:g_image
	}];
	this.levels[1] = [{
		id : "ground",
		x : this.canvasWidth / 2 / SCALE,
		y : this.canvasHeight / SCALE,
		halfHeight : 1,
		halfWidth : this.canvasWidth  / SCALE,
		color : 'yellow'
	}, {
		id : "b1",
		x : 17,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	}, {
		id : "b2",
		x : 17,
		y : this.canvasHeight / SCALE - 4.75-0.5,
		halfHeight : 0.25,
		halfWidth : 2,
		strength : 30,
		animation: g_animations["glass1"],
		image:g_image2,
		initAngle:0
	} , {
		id : "target",
		x : 18.9,
		y : this.canvasHeight / SCALE - 1.5,
		radius : 0.5,
		strength : 50,
		animation: g_animations["pig1"],
		image:g_image
	}];
	this.levels[2] = [{
		id : "ground",
		x : this.canvasWidth / 2 / SCALE,
		y : this.canvasHeight / SCALE,
		halfHeight : 1,
		halfWidth : this.canvasWidth  / SCALE,
		color : 'yellow'
	}, {
		id : "b1",
		x : 17,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	}, {
		id : "b2",
		x : 17,
		y : this.canvasHeight / SCALE - 4.75-0.5,
		halfHeight : 0.25,
		halfWidth : 2,
		strength : 30,
		animation: g_animations["glass1"],
		image:g_image2,
		initAngle:0
	}, {
		id : "b3",
		x : 15.2,
		y : this.canvasHeight / SCALE - 7-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 30,
		animation: g_animations["wood1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "b4",
		x : 18.8,
		y : this.canvasHeight / SCALE - 7-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 30,
		animation: g_animations["wood1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "target",
		x : 18.9,
		y : this.canvasHeight / SCALE - 1.5,
		radius : 0.5,
		strength : 50,
		animation: g_animations["pig1"],
		image:g_image
	}];
	this.levels[3] = [{
		id : "ground",
		x : this.canvasWidth / 2 / SCALE,
		y : this.canvasHeight / SCALE,
		halfHeight : 1,
		halfWidth : this.canvasWidth  / SCALE,
		color : 'yellow'
	}, {
		id : "b3",
		x : 11,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	}, {
		id : "b2",
		x : 14,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	}, {
		id : "b1",
		x : 17,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "target",
		x : 18.9,
		y : this.canvasHeight / SCALE - 1.5,
		radius : 0.5,
		strength : 20,
		animation: g_animations["pig1"],
		image:g_image
	}];
	
	// id-> Entity
	// can't be this. used in anonymous function
	entities = {};
	entities2 = {};

	// can't be this. used in anonymous function
	boxSim = null;

	this.initialState = [ {
		id : "ground",
		x : this.canvasWidth / 2 / SCALE,
		y : this.canvasHeight / SCALE,
		halfHeight : 1,
		halfWidth : this.canvasWidth  / SCALE,
		color : 'yellow'
/*	}, {
		id : "ball",
		x : 1.5,
		y : this.canvasHeight / SCALE - 2,
		radius : 0.5,
		animation: g_animations["bird1"]*/
	}, {
		id : "b1",
		x : 17,
		y : this.canvasHeight / SCALE - 2.5-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 50,
		animation: g_animations["stone1"],
		image:g_image2,
		initAngle:90
	}, {
		id : "b2",
		x : 17,
		y : this.canvasHeight / SCALE - 4.75-0.5,
		halfHeight : 0.25,
		halfWidth : 2,
		strength : 30,
		animation: g_animations["glass1"],
		image:g_image2,
		initAngle:0
	}, {
		id : "b3",
		x : 15.2,
		y : this.canvasHeight / SCALE - 7-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 30,
		animation: g_animations["wood1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "b4",
		x : 18.8,
		y : this.canvasHeight / SCALE - 7-0.5,
		halfHeight : 2,
		halfWidth : 0.20,
		strength : 30,
		animation: g_animations["wood1"],
		image:g_image2,
		initAngle:90
	} , {
		id : "target",
		x : 18.9,
		y : this.canvasHeight / SCALE - 1.5,
		radius : 0.5,
		strength : 50,
		animation: g_animations["pig1"],
		image:g_image
	} ];
	this.ballState = [{
		id : "ball",
		x : 1.5,
		y : this.canvasHeight / SCALE - 2,
		radius : 0.3,
		strength : 30,
		animation: g_animations["bird1"],
		image:g_image
	}];

	this.startupScene = function(image) {
		var audio = this.getAudio("title_theme.mp3");
		audio.loop = true;
		audio.play();
		boxSim = new BoxSim(60, false, this.canvasWidth, this.canvasHeight, SCALE);
		
		this.restartGame(1);

		this.startupVisualGameObject(image, 0, 0, 0);
		return this;
	};
	    
	this.update = function(/** Number */
	dt, /** CanvasRenderingContext2D */
	context, /** Number */
	xScroll, /** Number */
	yScroll) {
		if (g_pressedKeys[82])// R KEY
		{
			this.restartGame(this.currentLevel);
			g_pressedKeys[82] = false;
		}
		
		if(g_mouse.slingshotFire && !g_mouse.slingshotFinish){
			var distance = Math.sqrt(Math.pow(90 - g_mouse.pointX, 2) + Math.pow(this.canvasHeight - 80 - g_mouse.pointY, 2));
			var angle = Math.acos((90 - g_mouse.pointX) / distance) / ( Math.PI) * 180;
			entity = entities2["ball"];
			entity.x = g_mouse.pointX / SCALE;
			entity.y = g_mouse.pointY / SCALE;
			entities["ball"] = entity;
			boxSim.setBodies(entities2);
			boxSim.applyImpulse("ball", angle, distance /5 );
			g_mouse.slingshotFinish = true;
			
			this.getAudio("title_theme.mp3").pause();
			this.getAudio("bird 01 flying.wav").play();
		}
		
		// step world and get body status
		boxSim.update();
		bodiesState = boxSim.getState();

		var graveyard = [];

		for ( var id in bodiesState) {
			var entity = entities[id];

			if (entity && entities[id].dead) {
				boxSim.removeBody(id);
				graveyard.push(id);
			} else if (entity) {
				entity.update(bodiesState[id], dt);
			}
		}

		for ( var i = 0; i < graveyard.length; i++) {
			delete entities[graveyard[i]];
			if (graveyard[i] == "target") {
				var audio = this.getAudio("level_complete.mp3");
				audio.addEventListener("ended", function(e){
					audio.removeEventListener("ended");
					g_GameObjectManager.applicationManager.scene.levelClear = true;
				});
				audio.play();
				
				return;
			}
		}
	};

	this.draw = function(/** Number */
	dt, /** CanvasRenderingContext2D */
	context, /** Number */
	xScroll, /** Number */
	yScroll) {

		// don't need to clear canvas, for GameObjectManager has done it
		for ( var id in entities) {
			var entity = entities[id];
			entity.draw(dt, context, xScroll, yScroll);
		}
		if (this.levelClear) {
			//TODO: draw something while level cleared
			this.restartGame(this.currentLevel + 1);
		}

	};

	this.restartGame = function(level){
		if (level > this.levels.length) {
			//TODO:all level cleared
			//return;
			g_bgImage.src = "images/bg_win.png";
			clearInterval(g_timer);
			g_timer = setInterval(function() {
				g_GameObjectManager.context2D.clearRect(0, 0, g_GameObjectManager.canvas.width, g_GameObjectManager.canvas.height);
				g_GameObjectManager.context2D.drawImage(g_bgImage, 0, 0,
						g_GameObjectManager.canvas.width, g_GameObjectManager.canvas.height);
			}, SECONDS_BETWEEN_FRAMES);
			
			this.levelClear = false;
			var audio = this.getAudio("game_complete.mp3");
			audio.loop = true;
			audio.play();
			return;
		}

		g_bgImage.src = "images/bg.png";
		$("#level").html("Level " + (level));
		this.currentLevel = level;
		this.levelClear = false;
		//this.getAudio("level start military a1.mp3").play();
		
		boxSim.reset();
		boxSim.addContactListener({
			BeginContact : function(idA, idB) {
			},

			PostSolve : function(idA, idB, impulse) {
				if (impulse < 0.1)
					return;
				var entityA = entities[idA];
				var entityB = entities[idB];
				entityA.hit(impulse, entityB);
				entityB.hit(impulse, entityA);
			}
		});
		
		g_mouse.slingshotFire = false;
		g_mouse.slingshotFinish = false;
		
		this.initialState = this.levels[level-1];
		entities = new Object();
		entities2 = new Object();
		for ( var i = 0; i < this.initialState.length; i++) {
			entities[this.initialState[i].id] = Entity
					.build(this.initialState[i]);
			entities[this.initialState[i].id].setAnimation(this.initialState[i].animation, this.initialState[i].image, this.initialState[i].initAngle);
		}
		entities2[this.ballState[0].id] = Entity.build(this.ballState[0]);
		entities2[this.ballState[0].id].setAnimation(this.ballState[0].animation, this.ballState[0].image, this.ballState[0].initAngle);

		// create body from entity
		boxSim.setBodies(entities);

	};

	this.getAudio = function(id){
		if(this.audios[id] == undefined) {
			this.audios[id] = new Audio();
			this.audios[id].src = "music/"+id;
			this.audios[id].load();
		}
		return this.audios[id];
	};
}
Scene.prototype = new VisualGameObject;
