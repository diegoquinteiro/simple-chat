SimpleChat.PostsRoute = Ember.Route.extend({
	last_request: Date.now(),
	setupController: function (controller, model) {
		var route = this;
		this.pollster = SimpleChat.Pollster.create({
	      onPoll: function() {
	      	var newItems = route.store.find('post', { 
	      		last_requested: controller.get('firstObject').get('createdAt').toISOString()
	      	});
	      	controller.addObjects(newItems);
	      }
	    });
	    var session = this.store.find('session', 'current');
	    controller.set('session', session);
	    current_session = session;
	    this.pollster.start();
	    this._super(controller, model);
	},
	deactivate: function () {
		this.pollster.stop();
	},
	model: function () {
		return this.store.find("post");
	}
});