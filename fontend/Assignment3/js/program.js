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
  var counter=0;
  // khoi tao
  function Employee(name,department,phone){
    this.id=++counter;
    this.name=name;
    this.department=department;
    this.phone=phone;
  }
  function initEmployees(){
    // kiem tra du lieu co data hay khong
    if(null==employees||employees.length==0){// du kieu khong co data bat dau khoi tao
    //init data
employees.push(new Employee("John Doe","Administration","(171) 555-2222"));
employees.push(new Employee("Peter Parker","Customer Service","(313) 555-5735"));
employees.push(new Employee("Fran Wilson","Human Resource","(503) 555-9931"));
  }
}
  function buildTable(){
    setTimeout(function(params){// sau 2 giay load tu tren mang vao server
      $('tbody').empty();// xoa toan bo nhung cai dang co di
      // sau do khoi tao lai 
      initEmployees();
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
    },2000);
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
    employees.push(new Employee(name,department,phone));// save du lieu
    hideModal();// an di <tat modal di>
    buildTable();
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
    var index=employees.findIndex(x=>x.id==id);
    //update employee
    employees[index].name=name;
    employees[index].department=department;
    employees[index].phone=phone;
    hideModal();
    showSuccessAlert();
    buildTable();
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
    var index=employees.findIndex(x=>x.id==id);
    employees.splice(index,1);
    buildTable();
  }
  function showSuccessAlert(){
    $("#success-alert").fadeTo(2000,500).slideUp(500,function(){
      $("#success-alert").slideUp(500);
    });
  }