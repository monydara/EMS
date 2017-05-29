Ext.define('ExtDesktop.view.module.lead.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridLead',
    store: 'sdn.Lead',
    title:'Registration List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                {
                    xtype:'textfield',
                    width:350 ,
                    name:'search',
                    emptyText:'-- Type For Search ---',
                },'->',
                {
                    xtype:'button',
                    text:'Advance',
                    action:'showAdvanceSearch',
                    iconCls:'icon-search'
                },{
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add'
                },{
                    text:'Copy',
                    iconCls:'icon-copy',
                    action:'Copy'
                },{
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit'
                },/*{
                    text:'Deposit',action:'Deposit',iconCls:'icon-deposit'
                },*/
                {
                    text:'Cancel',
                    action:'Cancel',
                    iconCls:'icon-delete'
                }
            ],
            autoScroll:true,
            columns: [
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{
                            text:'Photo',
                            width:135,
                            renderer:function(grid, col , rec){
                                var img = rec.get('image_url');

                                var html = "<img style='width: 120px; height:120px; border-radius:5px;border:1px solid gray;padding:2px' src='"+img+"'>";

                                return html;
                            }
                        },
                        {
                            dataIndex: 'first_name',
                            text: 'Personal Info',
                            width:300,
                            renderer:function(grid, col , rec){
                                var name = rec.get('first_name') + " "+rec.get('last_name');
                                var khr_name = rec.get("khr_first_name")+" "+rec.get("khr_last_name");
                                var dob = rec.get("date_of_birth");
                                var placeOfBirth = rec.get("place_of_birth");
                                var register = rec.get("registered_date");

                                var gender = rec.get("gender");
                                gender = (gender == "F") ? "Female" : "Male" ;

                                var html = "<div style='padding-bottom:5px'><b> Name : </b>"+name +"</div>"+
                                            "<div style='padding-bottom:5px'><b>Khmer Name : </b>"+khr_name+"</div>"+
                                            "<div style='padding-bottom:5px'><b>Gender : </b>"+ gender +"</div>"+
                                            "<div style='padding-bottom:5px'><b>DOB : </b>"+dob +"</div>"+
                                            "<div style='padding-bottom:5px'><b>Place Of Birth : </b>"+placeOfBirth +"</div>"+
                                            "<div style='padding-bottom:5px'><b>Register Date : </b>"+register+"</div>"
                                            ;

                                return html;
                            }
                        },{
                            text: 'Contact Info',
                            flex: 1,
                            renderer:function(grid, col, rec){
                                var phone = rec.get("phone_no"),
                                    email = rec.get("email"),
                                    address = rec.get("address");

                                var html ="<div style='padding-bottom:5px'><b> Phone : </b>"+phone +"</div>"+
                                            "<div style='padding-bottom:5px'><b> Email : </b>"+email+"</div>"+
                                            "<div style='padding-bottom:5px'><b> Address : </b>"+address+"</div>"
                                            ;

                                return html;
                            }
                        },{
                            text:'Study Info',
                            flex:1,
                            renderer:function(grid, col, rec){
                                var degree = rec.get("degree"),
                                    course = rec.get("course"),
                                    classShift = rec.get("class_shift"),
                                    note = rec.get("note")
                                    ;
                                var html =
                                            "<div style='padding-bottom:5px'><b> Degree : </b>"+degree+"</div>"+
                                            "<div style='padding-bottom:5px'><b>Course : </b>"+course +"</div>"+
                                            "<div style='padding-bottom:5px'><b>Class Shift : </b>"+classShift+"</div>"+
                                            "<div style='padding-bottom:5px'><b>Student No : </b>"+rec.get('student_no') +"</div>"+
                                            "<div style='padding-bottom:5px'><b>Note : </b>"+note +"</div>"

                                            ;

                                return html;
                            }
                        }
            ],
             bbar: Ext.create('Ext.PagingToolbar', {
                    store: 'sdn.Lead',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
            })

        });
        me.callParent(arguments);
    }

});
