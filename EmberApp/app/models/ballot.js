import DS from 'ember-data';

export default DS.Model.extend({
  line_items: DS.hasMany('line_items'),

  sorted_line_items: (function(){
    return this.get('line_items').sortBy('weight');
  }).property('line_items.@each.weight'),
});
