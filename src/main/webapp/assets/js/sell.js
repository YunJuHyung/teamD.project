/*<!--미리보기 function -->*/
function thumbnail(){
	var preview = document.querySelector('#preview');
	var fileinput = document.querySelector('#image');
	
	fileinput.addEventListener('change',function(){
		var file = fileinput.files[0];
		var reader = new FileReader();
		
		reader.onload = function () {
			preview.src=reader.result;
		}
		
		if(file){
			reader.readAsDataURL(file);
		}else{
			preview.src="";
		}
		
	})
}