import Ember from 'ember';

export default Ember.View.extend({
  attributeBindings: ['draggable'],
  draggable: 'true',
  templateName: 'line-item',
  classNames: 'line_item',

  dragStart: function(ev){
    var dragData = { id: this.content.get('id') };
    ev.dataTransfer.setData('application/json', JSON.stringify(dragData));
  }
});
