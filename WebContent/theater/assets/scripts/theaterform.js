function deletecheck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok){
		document.theaterform.menu.value='delete';
		document.theaterform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.theaterform.menu.value='insert';
	document.theaterform.submit();
}

function updatecheck(){
	document.theaterform.menu.value='update';
	document.theaterform.submit();	
}