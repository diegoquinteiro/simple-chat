SimpleChat.Post = DS.Model.extend({
	text: DS.attr('string'),
	user: DS.belongsTo('user'),
	createdAt: DS.attr('date')
});
