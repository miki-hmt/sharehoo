var SpriteSheet = function(data) {
    this.load(data);
};

SpriteSheet.prototype = {
    _sprites: [],
    _width: 32,
    _height: 32,

    load: function(data) {
        this._height = data.height||32;
        this._width = data.width||32;
        this._sprites = data.sprites;
    },

    getOffset: function(spriteName) {
        for(var i = 0, len = this._sprites.length; i < len; i++) {
            var sprite = this._sprites[i];

            if(sprite.name == spriteName) {
                return {
                    //x: (i * this._width) + (sprite.x||0),
                    //y: (sprite.y||0),
                    //x: this._width * (sprite.x||0),
                    //y: this._height * (sprite.y||0),
                	x: sprite.x,
                	y: sprite.y,
                    w: sprite.w||this._width,
                    h: sprite.h||this._height	
                };
            }
        }
        
        return null;
    }
};