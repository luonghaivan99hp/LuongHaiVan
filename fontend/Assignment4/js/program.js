$(function(){
    $(".header").load("header.html"); //load file header.html vao class header
    $(".main").load("home.html");
    $(".footer").load("footer.html");
  });
  function clickNavHome(){
    $(".main").load("home.html");
  }
  function clickNavViewListEmployees(){
    $(".main").load("viewlistemployees.html");
    buildTable();
  }
  var employees=[];
  // khoi tao
  function Employee(id,name,department,phone){
    this.id=id
    this.name=name;
    this.department=department;
    this.phone=phone;
  }
function getListEmployees() {
    // call API from server
    $.get("https://5ee0cd0d30deff0016c3f646.mockapi.io/api/v1/employees", function(data, status) {

        // reset list employees
        employees = [];

        // error
        if (status == "error") {
            // TODO
            alert("Error when loading data");
            return;
        }

        // success
        parseData(data);
        fillEmployeeToTable();
    });
}

function parseData(data) {
    // employees = data;

    data.forEach(function(item) {
        employees.push(new Employee(item.id, item.name, item.department, item.phone));
    });
}

  function fillEmployeeToTable(){
      employees.forEach(function(item){
        $('tbody').append(
          '<tr>'+
          '<td>'+item.name+'</td>'+
          '<td>'+item.department+'</td>'+
          '<td>'+item.phone+'</td>'+
          '<td>'+
          '<a class="edit" title="Edit" data-toggle="tooltip" onclick="openUpdateModal('+ item.id +')"><i class="material-icons">&#xE254;</i></a>'+
          '<a class="delete" title="Delete" data-toggle="tooltip" onclick="openConfirmDelete('+ item.id +')"><i class="material-icons">&#xE872;</i></a>'+
          '</td>'+
          '</tr>')
      });
  }
function buildTable() {
    $('tbody').empty();
    getListEmployees();
}
  function openAddModal(){
    resetFrom();
    openModal();
  }
  //reset lai from sau moi lan nhap
  function resetFrom(){
    document.getElementById("id").value="";
    document.getElementById("name").value="";
    document.getElementById("department").value="";
    document.getElementById("phone").value="";
  }
  function openModal(){
    $('#myModal').modal('show');
  }
  function hideModal(){
    $('#myModal').modal('hide');
  }
  function addEmployee(){
    // lay du lieu vua nhap vao
    var name=document.getElementById("name").value;
    var department=document.getElementById("department").value;
    var phone=document.getElementById("phone").value;

    var employee = {
        name: name,
        department: department,
        phone: phone
    };

    $.post("https://5ee0cd0d30deff0016c3f646.mockapi.io/api/v1/employees", employee,
        function(data, status) {
            // error
            if (status == "error") {
                alert("Error when loading data");
                return;
            }

            // success
            hideModal();
            showSuccessAlert();
            buildTable();
        });
  }
 
  function openUpdateModal(id){

    var index=employees.findIndex(x=>x.id==id);// giong vong for each moi lan lap neu id truyen vao trung voi id trong list thi fill data vao
    //fill data
    document.getElementById("id").value=employees[index].id;
    document.getElementById("name").value=employees[index].name;
    document.getElementById("department").value=employees[index].department;
    document.getElementById("phone").value=employees[index].phone;
    openModal();
  }
  function save(){
    var id=document.getElementById("id").value;
if(id==null||id==""){
addEmployee();
}
else{
  updateEmployee();
}
  }
  function updateEmployee(){
    var id=document.getElementById("id").value;
    var name=document.getElementById("name").value;
    var department=document.getElementById("department").value;
    var phone=document.getElementById("phone").value;
var employee = {
        name: name,
        department: department,
        phone: phone
    };

    $.ajax({
        url: 'https://5ee0cd0d30deff0016c3f646.mockapi.io/api/v1/employees/' + id,
        type: 'PUT',
        data: employee,
        success: function(result) {
            // error
            if (result == undefined || result == null) {
                alert("Error when loading data");
                return;
            }

            // success
            hideModal();
            showSuccessAlert();
            buildTable();
        }
    });
  }
  function openConfirmDelete(id){
    var index=employees.findIndex(x=>x.id==id);
    var name=document.getElementById("name").value;
    var result=confirm("ban co muon xoa ten "+name+"?");
    if(result){
     deleteEmployee(id);
    }
  }
  function deleteEmployee(id){
    $.ajax({
        url: 'https://5ee0cd0d30deff0016c3f646.mockapi.io/api/v1/employees/' + id,
        type: 'DELETE',
        success: function(result) {
            // error
            if (result == undefined || result == null) {
                alert("Error when loading data");
                return;
            }

            // success
            showSuccessAlert();
            buildTable();
        }
    });
  }
  function showSuccessAlert(){
    $("#success-alert").fadeTo(2000,500).slideUp(500,function(){
      $("#success-alert").slideUp(500);
    });
  }