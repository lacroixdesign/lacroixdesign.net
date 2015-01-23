$(function() {

  $('#awesomeForm').isHappy({
    fields: {
      // reference the field you're talking about, probably by `id`
      // but you could certainly do $('[name=name]') as well.
      '#yourName': {
        required: true,
        message: 'Might we inquire your name'
      },
      '#email': {
        required: true,
        message: 'How are we to reach you sans email??',
        test: happy.email // this can be *any* function that returns true or false
      }
    }
  });

});
