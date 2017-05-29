Ext.define('ExtDesktop.view.account.Home',{
    extend:'Ext.panel.Panel',
    widget:'alias.FmHomeAccount',
    title:'Home',
    autoScroll:true,
    initComponent:function () {
        Ext.apply(this, {
            items:[
                this.getMenuView()
            ]
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
               url:'/Security/menu_account',
               reader: {
                   type: 'json',
                   root: 'data',
                   successProperty: 'success'
               },
               listeners :
               {
                   exception : function(proxy, response, operation)
                   {
                       Ext.MessageBox.show(
                           {
                               title : 'REMOTE EXCEPTION',
                               msg : operation.getError(),
                               icon : Ext.MessageBox.ERROR,
                               buttons : Ext.Msg.OK
                           });
                   }
               }
           }
    });
        var view= Ext.create('Ext.view.View', {
                store: store,
                bodyPadding:20,
                tpl: [
                    '<tpl for=".">',
                        '<div class="thumb-wrap iconImageMid" >',
                        '<div class="thumb"><img class="imageSizeMid" src="{url}" title="{name}"></div>',
                         '<center><span><b><font face="Cambria">{name}</font></b></span></center></div>',
                    '</tpl>',
                    '<div class="x-clear"></div>'
                ],            
                height: 310,
                trackOver: true,
                overItemCls: 'x-item-over',
                itemSelector: 'div.thumb-wrap',
                emptyText: 'No images to display',
                style:'margin:0px auto !important',
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

                        var me=this;
                        Util.viewPage(me,nodes);
                    }
                }
            });
            return view;
        }
});