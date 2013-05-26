function deletecheck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok){
		document.seatform.menu.value='delete';
		document.seatform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.seatform.menu.value='insert';
	document.seatform.submit();
}

function updatecheck(){
	document.seatform.menu.value='update';
	document.seatform.submit();	
}