<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp"%>
<style>
	.fileDrop {
	  width: 100%;
	  height: 200px;
	  border: 1px dotted gray;
	  background-color: lightslategrey;
	  margin: auto;
	  
	}
  	.popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
     }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     }   	
</style>

	<div class='popup back' style="display:none;"></div>
 	   <div id="popup_front" class='popup front' style="display:none;">
       <img id="popup_img">
    </div>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->
				
<form role="form" method="post" id="registerForm">
	
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}">

<div class="box-body">

	<div class="form-group">
		<label for="exampleInputEmail1">BNO</label>
		<input type="text" name="bno" class="form-control" value="${boardVO.bno}"
			readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label>
		<input type="text" name="title" class="form-control" value="${boardVO.title}">
	</div>
	
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea rows="3" class="form-control" name="content">${boardVO.content}</textarea>
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label>
		<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
	</div>
	
	<div class="form-group">
			<label for="exampleInputEmail1">File DROP Here</label>
			<div class="fileDrop"></div>
	</div>
</div>
<!-- /.box-body -->
<div class="box-footer">

		<div>
			<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>

	<button type="submit" class="btn btn-primary">SAVE</button>
	<button type="submit" class="btn btn-warning">CANCEL</button>
</div>
</form>

<!-- Handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
</script>

<!-- upload.js -->
<script type="text/javascript" src="../resources/js/upload.js"></script>

<!-- 화면에 보일 각 파일을 템플릿화 -->
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
			</a>
		</span>
		</div>
			<i class="fa fa-fw fa-remove" data-src="{{fullName}}"></i>
	</li>
</script>

<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function (event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function (event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function (data) {
				
				var fileInfo = getFileInfo(data);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
			}
		});
	});
	
</script>

<script>
/*
...579p.
...화면에서 small태그로 된 'x' 삭제버튼을 클릭하면 'data-src'속성값으로
...사용된 파일의 이름을 얻어와서 POST방식으로 호출함.
*/			
$(".uploadedList").on("click", "i", function(event){
	var that = $(this);
	var tmp = that.attr("data-src");
	console.log("tmp : " + tmp);
	
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("data-src")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.parent('li').remove(); 
		   }
	   }
	});
});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		formObj.submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str ="";
			$(".uploadedList .delbtn").each(function(index){
				 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
			});
			
			that.append(str);
			console.log(str);
			
			that.get(0).submit();
		});
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function() {
			self.location = "/sboard/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
	});
	
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#template").html());
	$.getJSON("/sboard/getAttach/"+bno,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	
	$(".uploadedList").on("click", ".mailbox-attachment-name", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log('imgTag.attr = ' + imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	
</script>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<%@include file="../include/footer.jsp"%>