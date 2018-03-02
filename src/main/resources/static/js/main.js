'use strict';

$(document).ready( function () {
    
    var table = $('#employee-table').DataTable({    	
		'ajax' : '/api/employee/list',
		'serverSide' : true,
		'searching': false,
		'lengthChange': false,
		"pageLength": 2,
		'bInfo': false,
		// https://datatables.net/reference/api/page.info()
		// https://legacy.datatables.net/ref
		// http://legacy.datatables.net/usage/i18n (this is for curiosity)
		"fnDrawCallback": function(oSettings) {
		    var pageInfo = this.api().page.info();
//			console.log( 'fnDrawCallback' );
//		    console.log(pageInfo.start)
//		    console.log(pageInfo.end)
//		    console.log(pageInfo.recordsDisplay)
		    var info = (pageInfo.start+1)+"-"+pageInfo.end+" / "+pageInfo.recordsDisplay;
		    $("#paginate_info").text(info);
		  },
		"dom": "lfrti",
		'columnDefs': [
		    { 'orderable': false, 'targets': '_all' }
		],
		'columns' : [ {
			data : 'name',
			render: function (data, type, row) { 
				 if(data){
					 return "<a href='/employee/details/" + row.employeeId + "' target='_blank'>" + data + "</a>";
				 }else{
				 	return data; 
				 }
			 }
		}, {
			data : 'workPhone'
		}, {
			data : 'workEmail'
			
		}, {
			data : 'department',
			 render: function (data) { 
				 if(data){
					 return data.name;
				 }else{
				 	return data; 
				 }
			 }
		}, {
			data : 'jobTitle',
			 render: function (data) { 
				 if(data){
					 return data.name;
				 }else{
					 return data; 
				 }
			 }
		}, {
			data : 'manager',
			 render: function (data) { 
				 if(data){
					 return data.name;
				 }else{
					 return data; 
				 }
			 }
		} ]
	});
    
    var oTable = $('#employee-table').dataTable();
    
    $("#paginate_left").click(function(){
    	oTable.fnPageChange( 'previous' );
	});
	$("#paginate_right").click(function(){
		oTable.fnPageChange( 'next' );
	});
} );

