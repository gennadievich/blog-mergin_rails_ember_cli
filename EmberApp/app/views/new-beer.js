import Ember from 'ember';

export default Ember.View.extend({
  keyDown: function(e) {
    if(e.keyCode === 13 && e.target.value.length > 5) {
      this.content.send('addBeer', e.target.value);
      Ember.$(e.target).val('');
    }
  }
});
