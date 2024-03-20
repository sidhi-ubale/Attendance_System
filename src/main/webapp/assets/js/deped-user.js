/*
*sdfsd
*/
var valid = true;

//fill the changepassword form
$(document).ready(function() {
	$.ajax({
			url: '../data/get_session_logged_data.php',
			type: 'post',
			dataType: 'json',
			success: function (data) {
				$('#change-username').val(data.emp_un);
				$('#user-id').val(data.emp_id);
				$('#user-account').html('<span class="glyphicon glyphicon-user"></span> '+
					data.emp_fname+' '+data.emp_lname+'<span class="caret"></span>');
			},
			error: function (){
				alert('Error: L7+');
			}
		});
});

/*change user password */
$(document).on('submit', '#form-changepassword', function(event) {
	event.preventDefault();
	/* Act on the event */
	var validate = '';
	var form_data = new Array(
									$('#change-username'),	
									$('#change-password'),	
									$('#confirm-password')
								);

	var data = new Array(form_data.length);
	for(var i = 0; i < form_data.length; i++){
		if(form_data[i].val() == 0){
			form_data[i].parent().parent().addClass('has-error');
		}else{
			form_data[i].parent().parent().removeClass('has-error');
			data[i] = form_data[i].val();
			validate += i;
		}
	}

	if(validate == '012'){
		if(form_data[1].val() != form_data[2].val()){
			$('#changepass-msg').text('Password not match!');
			$('#change-password').parent().parent().addClass('has-error');
			$('#confirm-password').parent().parent().addClass('has-error');
		}else{
			// alert('match');
			$.ajax({
					url: '../data/save_changepassword.php',
					type: 'post',
					dataType: 'json',
					data: {
						uid : $('#user-id').val(),
						un : $('#change-username').val(),
						pwd : $('#confirm-password').val()
					},
					success: function (data) {
						if(data.valid == valid){
							$('#modal-changepass').modal('hide');
							$('#modal-message-box').find('.modal-body').text(data.msg);
							$('#modal-message-box').modal('show');
						}
					},
					error: function (){
						alert('Error: L66+ #form-changepassword');
					}
				});
			//tiger reset form .reminder
		}

	}
});
/*end change user password */

/*show all item's owned*/
function user_item_owned()
{
	$.ajax({
			url: '../data/user_item_owned.php',
			type: 'post',
			// dataType: 'json',
			success: function (data) {
				$('#item-owned').html(data);
			},
			error: function(){
				alert('Error: L91+ user_item_owned');
			}
		});
}
user_item_owned();
/*end show all item's owned*/


/*request for*/
var req_item_id;
var req_purpose;

function request(item_id, purpose)
{
	req_item_id = item_id;
	req_purpose = purpose;
	$('#modal-new-request').modal('show');
}

$('#confirm-req-modal').click(function(event) {
	/* Act on the event */
	$.ajax({
			url: '../data/new_request.php',
			type: 'post',
			// dataType: 'json',
			data: {
				iID : req_item_id,
				pur : req_purpose
			},
			success: function (data) {
				console.log(data);
				$('#modal-new-request').modal('hide');
				user_item_owned();
			},
			error: function (){
				alert('Error: L113+ request');
			}
		});
});
/*end request for*/

/*list of owner's request*/
function show_all_owners_request()
{
	$.ajax({
			url: '../data/show_all_owners_request.php',
			type: 'post',
			success: function (data) {
				$('#owners-request').html(data);
			},
			error: function(){
				alert('Error: L143+ all owners request');
			}
		});
	
}
show_all_owners_request();
/* end list of owner's request*/

//this is to confirm the request in the request list, to let him/her know that his or her request is done.
function confirm_done(item_id){
	$.ajax({
			url: '../data/confirm_done.php',
			type: 'post',
			data: {
				item_id : item_id
			},
			success: function (data) {
				show_all_owners_request();
			},
			error: function(){
				alert('Error: L162+ confirm_done');
			}
		});
}
//end this is to confirm the request in the request list, to let him/her know that his or her request is done.
