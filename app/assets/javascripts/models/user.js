SimpleChat.User = DS.Model.extend({
	name: DS.attr('string'),
	photo: DS.attr('string'),
	current: DS.attr('boolean')
});
