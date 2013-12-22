// for more details see: http://emberjs.com/guides/controllers/

SimpleChat.PostsController = Ember.ArrayController.extend({
	actions : {
		createPost: function () {
			var text = this.get("text");
			if (!text.trim()) { return; }

			var post = this.store.createRecord('post', {
				text: text
			});

			this.set("text", "");

			post.save();
		}
	},
	sortProperties: ['createdAt'],
  	sortAscending: false
});
