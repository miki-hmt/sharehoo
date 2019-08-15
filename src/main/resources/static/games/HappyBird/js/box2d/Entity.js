var SCALE = 30;
var NULL_CENTER = {
	x : null,
	y : null
};

function Entity(id, x, y, angle, center, color, strength) {
	this.id = id;
	this.x = x;
	this.y = y;
	this.angle = angle || 0;
	this.center = center;
	this.color = color || "red";
	this.isHit = false;
	this.strength = strength;
	this.dead = false;
}

Entity.prototype.setAnimation = function(animation, image, initAngle) {
	this.image = image;
	this.animation = animation;
	this.initAngle = initAngle || 0;
};

Entity.prototype.getAnimation = function() {
	return this.animation;
};

Entity.prototype.hit = function(impulse, source) {
	this.isHit = true;
	if (this.strength) {
		this.strength -= impulse;
		if (this.strength <= 0) {
			this.dead = true;
			if (this.id == "target") {
				g_GameObjectManager.applicationManager.scene.getAudio(
						"piglette damage a1.wav").play();
			} else if (this.id != "ball") {
				// if(Math.random() > 0.8){
				g_GameObjectManager.applicationManager.scene.getAudio(
						"wood damage a1.wav").play();
				g_GameObjectManager.applicationManager.scene.getAudio(
						"rock damage a1.wav").play();
				// }
			}
		}
	}
};

Entity.prototype.getColor = function() {
	return this.color;
};

Entity.prototype.update = function(state, /**Number*/ dt, /**CanvasRenderingContext2D*/ ctx, /**Number*/ xScroll, /**Number*/ yScroll) {
	this.x = state.x;
	this.y = state.y;
	this.center = state.c;
	this.angle = state.a;

	if (this.animation) {
		this.animation.animate(dt);
	}
};

Entity.prototype.draw = function(/**Number*/ dt, /**CanvasRenderingContext2D*/ ctx, /**Number*/ xScroll, /**Number*/ yScroll) {
/*

	ctx.fillStyle = 'black';
	ctx.beginPath();
	ctx.arc(this.x * SCALE, this.y * SCALE, 4, 0, Math.PI * 2, true);
	ctx.closePath();
	ctx.fill();

	ctx.fillStyle = 'yellow';
	ctx.beginPath();
	ctx.arc(this.center.x * SCALE, this.center.y * SCALE, 2, 0, Math.PI * 2,
			true);
	ctx.closePath();
	ctx.fill();

 */
	// clear
	this.isHit = false;
		
	if (this.animation) {
		var frame = this.animation.getSprite();
		ctx.save();
		ctx.translate(this.x * SCALE - xScroll, this.y * SCALE - yScroll);
		ctx.rotate(this.angle+this.initAngle / 180 * Math.PI);
		ctx.drawImage(this.image, frame.x, frame.y, frame.w, frame.h, - frame.w /2, 0 - frame.h/2, frame.w, frame.h);
		ctx.restore();
	}
};

Entity.build = function(def) {
	if (def.radius) {
		return new CircleEntity(def.id, def.x, def.y, def.angle, NULL_CENTER,
				def.color, def.strength, def.radius);
	} else if (def.polys) {
		return new PolygonEntity(def.id, def.x, def.y, def.angle, NULL_CENTER,
				def.color, def.strength, def.polys);
	} else {
		return new RectangleEntity(def.id, def.x, def.y, def.angle,
				NULL_CENTER, def.color, def.strength, def.halfWidth,
				def.halfHeight);
	}
};

function CircleEntity(id, x, y, angle, center, color, strength, radius) {
	color = color || 'aqua';
	Entity.call(this, id, x, y, angle, center, color, strength);
	this.radius = radius;
}
CircleEntity.prototype = new Entity();
CircleEntity.prototype.constructor = CircleEntity;

CircleEntity.prototype.draw = function(/**Number*/ dt, /**CanvasRenderingContext2D*/ ctx, /**Number*/ xScroll, /**Number*/ yScroll) {
/*
	ctx.save();
	ctx.translate(this.x * SCALE, this.y * SCALE);
	ctx.rotate(this.angle);
	ctx.translate(-(this.x) * SCALE, -(this.y) * SCALE);

	ctx.fillStyle = this.getColor();
	ctx.strokeStyle = 'black';
	ctx.beginPath();
	ctx.arc(this.x * SCALE, this.y * SCALE, this.radius * SCALE, 0,
			Math.PI * 2, true);
	ctx.moveTo(this.x * SCALE, this.y * SCALE);
	ctx.lineTo((this.x) * SCALE, (this.y + this.radius) * SCALE);
	ctx.closePath();
	ctx.fill();
	ctx.stroke();

	ctx.restore();
*/
	if (this.animation) {
		var frame = this.animation.getSprite();
		ctx.save();
		ctx.translate(this.x * SCALE - xScroll, this.y * SCALE - yScroll);
		ctx.rotate(this.angle);//+this.initAngle / 180 * Math.PI);
		ctx.drawImage(this.image, frame.x, frame.y, frame.w, frame.h, - this.radius * SCALE, 0 - this.radius * SCALE, this.radius * 2 * SCALE, this.radius * 2 * SCALE);
		ctx.restore();
	}
	//Entity.prototype.draw.call(this, dt, ctx, xScroll, yScroll);
};

function RectangleEntity(id, x, y, angle, center, color, strength, halfWidth,
		halfHeight) {
	Entity.call(this, id, x, y, angle, center, color, strength);
	this.halfWidth = halfWidth;
	this.halfHeight = halfHeight;
}
RectangleEntity.prototype = new Entity();
RectangleEntity.prototype.constructor = RectangleEntity;

RectangleEntity.prototype.draw = function(/**Number*/ dt, /**CanvasRenderingContext2D*/ ctx, /**Number*/ xScroll, /**Number*/ yScroll) {
/*
	ctx.save();
	ctx.translate(this.x * SCALE, this.y * SCALE);
	ctx.rotate(this.angle);
	ctx.translate(-(this.x) * SCALE, -(this.y) * SCALE);
	ctx.fillStyle = this.getColor();
	ctx.fillRect((this.x - this.halfWidth) * SCALE, (this.y - this.halfHeight)
			* SCALE, (this.halfWidth * 2) * SCALE, (this.halfHeight * 2)
			* SCALE);
	ctx.restore();
*/
	if (this.animation) {
		var frame = this.animation.getSprite();
		ctx.save();
		ctx.translate(this.x * SCALE - xScroll, this.y * SCALE - yScroll);
		ctx.rotate(this.angle);//+this.initAngle / 180 * Math.PI);
		ctx.drawImage(this.image, frame.x, frame.y, frame.w, frame.h, - this.halfWidth * SCALE, 0 - this.halfHeight * SCALE, this.halfWidth * 2 * SCALE, this.halfHeight * 2 * SCALE);
		ctx.restore();
	}
	//Entity.prototype.draw.call(this, dt, ctx, xScroll, yScroll);
};

function PolygonEntity(id, x, y, angle, center, color, strength, polys) {
	Entity.call(this, id, x, y, angle, center, color, strength);
	this.polys = polys;
}
PolygonEntity.prototype = new Entity();
PolygonEntity.prototype.constructor = PolygonEntity;

PolygonEntity.prototype.draw = function(/**Number*/ dt, /**CanvasRenderingContext2D*/ ctx, /**Number*/ xScroll, /**Number*/ yScroll) {
	ctx.save();
	ctx.translate(this.x * SCALE, this.y * SCALE);
	ctx.rotate(this.angle);
	ctx.translate(-(this.x) * SCALE, -(this.y) * SCALE);
	ctx.fillStyle = this.getColor();

	for ( var i = 0; i < this.polys.length; i++) {
		var points = this.polys[i];
		ctx.beginPath();
		ctx.moveTo((this.x + points[0].x) * SCALE, (this.y + points[0].y)
				* SCALE);
		for ( var j = 1; j < points.length; j++) {
			ctx.lineTo((points[j].x + this.x) * SCALE, (points[j].y + this.y)
					* SCALE);
		}
		ctx.lineTo((this.x + points[0].x) * SCALE, (this.y + points[0].y)
				* SCALE);
		ctx.closePath();
		ctx.fill();
		ctx.stroke();
	}

	ctx.restore();

	Entity.prototype.draw.call(this, dt, ctx, xScroll, yScroll);
};