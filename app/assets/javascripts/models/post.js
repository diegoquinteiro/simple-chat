SimpleChat.Post = DS.Model.extend({
	text: DS.attr('string'),
	user: DS.belongsTo('user'),
	createdAt: DS.attr('date'),
	timeAgo: function () {
		var createdAt = this.get('createdAt');
		return moment(createdAt).fromNow();
	}.property('createdAt')
});
