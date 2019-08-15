var Animation = function(data, sprites) {
    this.load(data);
    this._sprites = sprites;
};

Animation.prototype = {
    _frames: [],
    _frame: null,
    _frameDuration: 0,

    load: function(data) {
        this._frames = data;
        this._frameIndex = 0;
        this._frameDuration = data[0].time;
    },

    animate: function(deltaTime) {
        this._frameDuration -= deltaTime;

        if(this._frameDuration <= 0) {
            this._frameIndex++;
            if(this._frameIndex == this._frames.length) {
                this._frameIndex = 0;
            }

            this._frameDuration = this._frames[this._frameIndex].time;
        }
    },

    getSprite: function() {
        return this._sprites.getOffset(this._frames[this._frameIndex].sprite);
    }
};