function Slingshot() {

	this.canvasWidth = g_GameObjectManager.canvas.width;
	this.canvasHeight = g_GameObjectManager.canvas.height;

	this.startupSlingshot = function(image) {
		
		
		this.startupVisualGameObject(image, 0, 0, 0);
		return this;
	};
	
	this.update = function(/** Number */
	dt, /** CanvasRenderingContext2D */
	context, /** Number */
	xScroll, /** Number */
	yScroll) {
	
	};
	
	this.draw = function(/** Number */
	dt, /** CanvasRenderingContext2D */
	context, /** Number */
	xScroll, /** Number */
	yScroll) {		
		context.drawImage(g_bgImage,0, 0, this.canvasWidth, this.canvasHeight);
		
		// draw slingshot
		var frame1 = g_sprites.getOffset("slingshot_1");
		var frame2 = g_sprites.getOffset("slingshot_2");
		context.save();		
		context.lineWidth = 4;
		context.beginPath();
		context.moveTo(85, this.canvasHeight - 80);
		if (g_mouse.slingshotReady) {
			context.lineTo(g_mouse.pointX, g_mouse.pointY);
		}
		context.lineTo(105, this.canvasHeight - 80);
		context.stroke();
		context.restore();

		if (g_mouse.slingshotReady && !g_mouse.slingshotFinish) {
			var frame = g_sprites.getOffset("bird_1");
			context.save();
			context.translate(g_mouse.pointX - xScroll, g_mouse.pointY - yScroll);
			context.drawImage(g_image, frame.x, frame.y, frame.w, frame.h, - frame.w /4, 0 - frame.h/4, frame.w/2, frame.h/2);
			context.restore();
		}

		context.save();
		context.translate(100, this.canvasHeight - 50);
		context.scale(0.4, 0.4);
		context.drawImage(g_image, frame1.x, frame1.y, frame1.w, frame1.h, - frame1.w /2, 0 - frame1.h/2, frame1.w, frame1.h);
		context.drawImage(g_image, frame2.x, frame2.y, frame2.w, frame2.h, -28- frame2.w /2, -45 - frame2.h/2, frame2.w, frame2.h);
		context.restore();
	};
}
Slingshot.prototype = new VisualGameObject;