Ext.define('ExtDesktop.view.HomePage',{
    extend:'Ext.panel.Panel',
    widget:'alias.FmHomePage',
    title:'Home',
    initComponent:function () {
        Ext.apply(this, {
            items:[
                this.getMenuView()
            ],
            bodyStyle:'background-image: url(resources/images/background/student_background.jpg)  !important; background-repeat: no-repeat;background-size: cover;'
        });
        this.callParent(arguments);
    },

    getMenuView:function(){
        ImageModel = Ext.define('ImageModel', {
            extend: 'Ext.data.Model',
            fields: [
               {name: 'name'},
               {name: 'url'},
               {name: 'action'}
            ]
        });
        var store = Ext.create('Ext.data.Store', {
            model: 'ImageModel',
            autoLoad: true,
            proxy: {
                    type: 'rest',
                    url:'/Security/menu_student',
                    reader: {
                        type: 'json',
                        root: 'data',
                        successProperty: 'success'
                    },
                    listeners :
                    {
                        exception : function(proxy, response, operation)
                        {
                            console.log(response);
                            Util.sessionTimeOut(response.responseText);
                        }
                    }
            }
        });

        var view= Ext.create('Ext.view.View', {
                store: store,
                bodyPadding:20,
                autoScroll:true,
                tpl: [
    						'<tpl for=".">',
    						'<div class="thumb-wrap iconImageMid" >',
    						'<div class="thumb"><img class="imageSizeMid" src="{url}" title="{name}"></div>',
    						'<center><span><b><font face="Cambria">{name}</font></b></span></center></div>',
    						'</tpl>',
    						'<div class="x-clear"></div>'
                ],
                height: 560,
                trackOver: true,
                overItemCls: 'x-item-over',
                itemSelector: 'div.thumb-wrap',
                emptyText: 'No images to display',
                style:'margin:0px auto !important;',

                plugins: [
                    Ext.create('Ext.ux.DataView.DragSelector', {}),
                    Ext.create('Ext.ux.DataView.LabelEditor', {dataIndex: 'name'})
                ],
                prepareData: function(data) {
                    Ext.apply(data, {
                        shortName: Ext.util.Format.ellipsis(data.name, 15)

                    });
                    return data;
                },
                listeners: {

                    itemclick: function(dv, nodes ){
                    	// get other controller because admission need pop up window
                    	var action = nodes.data.action;
                    	/*if(action == "Admission"){
                    		var ctr =ExtDesktop.app.getController("Admission");
                    		ctr.showFormAdmission(me);
                    	} else if(action=="AdmissionWU"){
                    		var ctr =ExtDesktop.app.getController("AdmissionWU");
                    		ctr.showFormAdmission(me);

                    	}else{*/
                    		var me=this;
                            Util.viewPage(me,nodes);
                    	// }

                    }
                }
        });

        return view;
    }

});
