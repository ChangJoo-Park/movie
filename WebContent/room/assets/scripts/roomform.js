function deletecheck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok){
		document.roomform.menu.value='delete';
		document.roomform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.roomform.menu.value='insert';
	document.roomform.submit();
}

function updatecheck(){
	document.roomform.menu.value='update';
	document.roomform.submit();	
}