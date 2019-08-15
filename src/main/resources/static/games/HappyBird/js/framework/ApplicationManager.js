/**
    The ApplicationManager is used to manage the application itself.
    @author <a href="mailto:matthewcasperson@gmail.com">Matthew Casperson</a>
    @class
 */
function ApplicationManager() {
	/**
	    Initialises this object
	    @return A reference to the initialised object
	 */
	this.startupApplicationManager = function() {
		$(document).keydown(function(e) {
			g_pressedKeys[e.which] = true;
		});
		$(document).keyup(function(e) {
			g_pressedKeys[e.which] = false;
		});
		
		g_GameObjectManager.canvas.addEventListener("mousedown", function(e) {
			g_mouse.isMouseDown = true;
			g_mouse.pointX = (e.clientX - g_GameObjectManager.canvas
					.getBoundingClientRect().left);
			g_mouse.pointY = (e.clientY - g_GameObjectManager.canvas
					.getBoundingClientRect().top);
			var distance = Math.sqrt(Math.pow(90 - g_mouse.pointX, 2) + Math.pow(g_GameObjectManager.canvas.height - 80 - g_mouse.pointY, 2));
			if (distance < 20) {
				g_mouse.slingshotReady = true;
				g_mouse.slingshotFire = false;
			}
			else{
				g_mouse.slingshotReady = false;
				g_mouse.slingshotFire = false;
			}
		}, true);

		g_GameObjectManager.canvas.addEventListener("mouseup", function(e) {
			g_mouse.isMouseDown = false;
			var distance = Math.sqrt(Math.pow(90 - g_mouse.pointX, 2) + Math.pow(g_GameObjectManager.canvas.height - 80 - g_mouse.pointY, 2));
			if (distance < 20) {
				g_mouse.slingshotReady = false;
				g_mouse.slingshotFire = false;
			}
			else{
				g_mouse.slingshotFire = g_mouse.slingshotReady;
				g_mouse.slingshotReady = false;
			}
		}, true);

		g_GameObjectManager.canvas.addEventListener("mousemove", function(e) {
			if (g_mouse.isMouseDown) {
				g_mouse.pointX = (e.clientX - g_GameObjectManager.canvas
						.getBoundingClientRect().left);
				g_mouse.pointY = (e.clientY - g_GameObjectManager.canvas
						.getBoundingClientRect().top);
			}
			// $("p.display").html("x="+g_mouse.pointX+"y="+g_mouse.pointY);
		}, true);

		this.slingshot = new Slingshot().startupSlingshot(g_image);
		this.scene = new Scene().startupScene(g_image);

		return this;

	};
};