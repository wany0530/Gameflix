var select = false;
function allSelect(){
	var checkBoxObj = document.querySelectorAll(".checkBox");
	for(var i=0; i<checkBoxObj.length; i++) {
		if(select == false) {
			checkBoxObj[i].checked = true;
		} else {
			checkBoxObj[i].checked = false;
		}
	}
	select = !select;
}