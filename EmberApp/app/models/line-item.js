import DS from 'ember-data';

export default DS.Model.extend({
  beer_name: DS.attr('string'),
  weight: DS.attr('number'),
  ballot: DS.belongsTo('ballot'),
});
