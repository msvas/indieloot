function selectPlan(selected_id, not_selected_id) {
  $('#plan' + selected_id).css('border', '3px solid #f42f54');
  $('#plan' + not_selected_id).css('border', 'none');
  $('#user_plan_id').val(selected_id + 1);
}

function redeem_game(id) {
  $.ajax({
      url:  "/redeem-game-key",
      dataType: "json",
      data: {
         game_id: id
      },
      success: function(data) {
        console.log(data.key);
        $('#before_redeem_' + id).hide();
        $('#after_redeem_' + id).show();
        $('#key_' + id).val(data.key);
        $('#copy_' + id).attr('data-clipboard-text', data.key);
      }
  });
}
