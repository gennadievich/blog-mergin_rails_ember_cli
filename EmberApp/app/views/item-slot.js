import Ember from 'ember';

export default Ember.View.extend({
  templateName: 'item-slot',

  dragOver: function(ev){
    ev.preventDefault();
  },

  drop: function(ev){
    var data = JSON.parse(ev.dataTransfer.getData('application/json'));
    this.get('controller').send('swap', data.id, this.content.get('id'));
  }
});
