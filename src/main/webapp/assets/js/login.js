
var valid = true;

//end log in submit 
$(document).on('submit', '#form-login', function(event) {
	event.preventDefault();
	/* Act on the event */
	var validate = '';
	var form_data = new Array(
								$('input[id=un]'),
								$('input[id=pwd]')
	  						);
	var data = new Array(form_data.length);
	for(var i = 0; i < form_data.length; i++){
		if(form_data[i].val() == ''){
			form_data[i].parent().parent().addClass('has-error');
		}else{
			form_data[i].parent().parent().removeClass('has-error');
			data[i] = form_data[i].val();
			validate += i;
		}
	}

	if(validate == '01'){
		$.ajax({
				url: 'data/user_login.php',
				type: 'post',
				dataType: 'json',
				data: {
					data: JSON.stringify(data)
				},
				success: function (data) {
					if(data.valid == valid){
						window.location = data.url;
					}else{
						$('#form-login').find('.text-danger').text(data.msg);
						alert(data.msg);
					}
					// console.log(data);
				},
				error: function (){
					alert('Error: L33+ #form-login');
				}
			});
	}



});									
//end log in submit 