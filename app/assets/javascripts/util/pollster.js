SimpleChat.Pollster = Ember.Object.extend({
  start: function(){
    this.timer = setInterval(this.onPoll.bind(this), 1000);
  },
  stop: function(){
    clearInterval(this.timer);
  },
  onPoll: function(){
    // Issue JSON request and add data to the store
  }
});

