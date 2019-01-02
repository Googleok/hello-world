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
</style>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" method="post" id="registerForm">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text"
				name="title" class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea rows="3" class="form-control" name="content" placeholder="Enter....."></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label>
			<input type="text"
				name="writer" class="form-control" value="${login.uid}" readonly="readonly">
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
		
		<button type="submit" class="btn btn-primary">Submit</button>
		<button type="reset" class="btn btn-warning">CANCEL</button>
	</div>
</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

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
	
	// form 태그의 submit 처리
	$("#registerForm").submit(function (event) {
		event.preventDefault();
	
		var that = $(this);
		
		var str = "";
		
		$(".uploadedList .delbtn").each(function (index) {
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'> ";
		});
		
		that.append(str);
		
	 	that.get(0).submit(); 
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

<%@include file="../include/footer.jsp"%>