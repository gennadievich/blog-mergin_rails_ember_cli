import Ember from 'ember';

export default Ember.Controller.extend({
  sortProperties: ['weight'],

  actions: {
    addBeer: function(name){
      var attrs = {
        beer_name: name,
        ballot: this.model,
        weight: _.last(this.model.get('sorted_line_items')).get('weight') + 1
      }
      var beer = this.store.createRecord('line_item', attrs);
      beer.save();
    },

    swap: function(line_item_id_1, line_item_id_2) {
      var li1, li1_weight, li2, li2_weight;
      li1 = this.model.get('line_items').findBy('id', line_item_id_1);
      li2 = this.model.get('line_items').findBy('id', line_item_id_2);
      li1_weight = li1.get('weight');
      li2_weight = li2.get('weight');
      li1.set('weight', li2_weight);
      li2.set('weight', li1_weight);
      return Ember.$.ajax({
        url: "/api/v1/ballots/" + (this.model.get('id')) + "/swap/" + (li1.get('id')) + "/" + (li2.get('id')),
        type: 'put'
      }).done(function() {}).fail(function() {
        li1.rollback();
        return li2.rollback();
      });
    }
  }
});
