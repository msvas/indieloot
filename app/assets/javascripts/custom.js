function selectPlan(selected_id, not_selected_id) {
  $('#plan' + selected_id).css('border', '3px solid #f42f54');
  $('#plan' + not_selected_id).css('border', 'none');
}