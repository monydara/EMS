var me, myVar;
Ext.define('ExtDesktop.controller.Util', {
    extend: 'Ext.app.Controller',
    init: function() {
        this.control({
            'combo': {
                change: this.checkValueComboBox
            }
        });
    },
    // to view full screen with elem html
    toggleFullScreen: function(elem) {
        // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
            if (elem.requestFullScreen) {
                elem.requestFullScreen();
            } else if (elem.mozRequestFullScreen) {
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullScreen) {
                elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            } else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
            }
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    },

    getValueFromStoreDetail: function(store) {
        var data = Ext.pluck(store.data.items, 'data');
        return data;
    },
    checkValueComboBox: function(field, value) {



        if (typeof(value) == "object" && value != null) {
            var valueField = field.valueField;
            if (field.xtype != 'timefield') {

                field.setValue(value[valueField]);
            }


        }



    },
    // -================= USING IT FOR AUTO SELECT FIRST ITEM IN COMBO
    // HOW TO USE
    //listeners:Util.firstSelect
    firstSelect: function() {
        return {
            boxready: function() {
                var me = this;
                var count = 0;
                if (!me.value) {
                    afterLoadStore();
                }

                function afterLoadStore() {

                    if (me.getStore().totalCount > 0) {
                        me.setValue(me.getStore().getAt(0).get(me.valueField), true);
                        me.fireEvent('select', me);
                    } else {
                        if (count == 1) {
                            me.store.load();
                        }

                        if (count < 100) setTimeout(function() {
                            afterLoadStore();
                            count++;
                        }, 100);
                    }

                }



                // fire the select event ( Event in extjs )

            }
        };
    },

    // delete object property from obj Ex. a={a:1,b:2,c:3} => a{a:1,c:3}
    // how to use deleteObj(obj,[=== array list ===]); return obj;
    deleteObj: function(obj, field) {

        field.forEach(function(name) {
            delete obj[name];

        });
        return obj;
    },

    msg: function(message, btn) {

        var win = Ext.create('Ext.window.Window', {
            // layout:'hbox',
            header: false,
            // width:'90%',
            style: " background-color: antiquewhite;text-align: center;border: 2px solid green;   border-radius: 10px;",
            bodyStyle: 'border-radius:10px',
            items: [{
                style: 'border-radius:10px; ',
                html: " <div style=' padding: 10px 30px 10px 30px;font-size: 15px ; font-weight:bold;color:crimson;'><center>  " + message + "</center></div> "
            }]

        });
        win.show();
        win.alignTo(Ext.getBody(), "tr-tr", ['-10%', 20]);


        setTimeout(function() {
            win.close();
        }, 5000);


        // toastr.options = {
        //       "closeButton": false,
        //       "debug": false,
        //       "newestOnTop": false,
        //       "progressBar": false,
        //       "positionClass": "toast-top-full-width",
        //       "preventDuplicates": false,
        //       "onclick": null,
        //       "showDuration": "300",
        //       "hideDuration": "1000",
        //       "timeOut": "5000",
        //       "extendedTimeOut": "1000",
        //       "showEasing": "swing",
        //       "hideEasing": "linear",
        //       "showMethod": "fadeIn",
        //       "hideMethod": "fadeOut"
        // }

        // toastr["error"](message)

    },
    msgSave: function(message) {
        $("<div />", {
            'class': 'topBarSave',
            text: message
        }).hide().prependTo("body").slideDown('fast').delay(3000).slideUp(function() {
            $(this).remove();
        });
    },
    ajaxSave: function(url, params, btn) {
        var objReturn;
        me = this;
        Ext.Ajax.request({
            url: url,
            params: params,
            success: function(response, success) {
                objReturn = Ext.decode(response.responseText);
                if (objReturn['success'] == true) {
                    btn.up('window').close();
                    me.msgSave(objReturn['message']);

                } else {
                    me.msg(objReturn['message']);
                }
            },
            failure: function(response, opts) {
                console.log('server-side failure with status code ' + response.status);
            }

        });

    },

    ajax: function(url, params, nextFunction, paramerter) {
        var objReturn;
        var me = this;
         Ext.MessageBox.wait("Please wait system processing data.....","System Processing")
        Ext.Ajax.request({
            url: url,
            params: params,
            success: function(response, success) {
                Ext.MessageBox.hide()

                objReturn = Ext.decode(response.responseText);
                if (objReturn.success) {
                    if (paramerter) {
                        nextFunction(objReturn, paramerter);
                    } else if (nextFunction) {
                        nextFunction(objReturn);
                    }
                } else {
                    Ext.MessageBox.hide()

                    me.msg(objReturn.message);

                }

            },
            failure: function(response, opts) {
                console.log('server-side failure with status code ' + response.status);
            }

        });

    },
    closeWindow: function(btn) {
        var win = btn.up('window');
        win.close();
    },

    selectGrid: function(btn, fileName, message) {
        var grid = btn.up("gridpanel");
        var row = grid.getSelectionModel().getSelection();
        if (row.length) {
            var win = Ext.create(fileName);
            var form = win.down('form');
            var record = row[0];
            form.loadRecord(record);
            win.show();
            win.center();
        } else {
            this.msg(message);
        }
    },
    selectGridName: function(btn, gridName, fileName, widget, formName, message) {
        var grid = btn.up(widget).down("gridpanel[name=" + gridName + "]");
        var row = grid.getSelectionModel().getSelection();
        if (row.length) {
            var win = Ext.create(fileName);
            var form = win.down('form[name=' + formName + ']');
            var record = row[0];
            form.loadRecord(record);
            win.show();
            win.center();
        } else {
            this.msg(message);
        }
    },

    showWaitMsgBox: function(title, message) {
        title = title ? title : "Progressing";
        message = message ? message : "Please Wait....";
        Ext.MessageBox.show({
            msg: message,
            progressText: title,
            width: 300,
            wait: true
        });
    },
    getRecord: function(btn, message) {
        var grid = btn.up("gridpanel");
        var row = grid.getSelectionModel().getSelection();
        if (row.length) {
            var record = row[0];
            grid.getSelectionModel().clearSelections();
            grid.getView().refresh();
            return record;
        } else {
            if (message) {

                this.msg(message);
            };
            return null;
        }
    },

    save: function(btn, stor, model) {
        var me = this;
                var win = btn.up('window'),
            form = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();
        var model = Ext.create('ExtDesktop.model.' + model);
        if (form.getForm().isValid()) {
            if (!record) { // add function
                model.set(values);
                stor.add(model);
            } else { // edit function
                record.set(values);
            }
            // check store has something change 
            // if( ){

                me.showWaitMsgBox();
            // }
            stor.sync({
                success: function(batch, options) {
                    if (win) {
                        win.close();
                    }
                    Ext.MessageBox.show({
                        title: 'Saved',
                        msg: 'Record Save Succeed.',
                        icon: Ext.MessageBox.INFO,
                        buttons: Ext.Msg.OK
                    });
                    stor.load();
                },
                failure: function(batch, options) {
                    stor.rejectChanges();
                    var msg = batch.proxy.reader.rawData.message;
                    Ext.MessageBox.show({
                        title: 'Error',
                        msg: msg,
                        icon: Ext.MessageBox.ERROR,
                        buttons: Ext.Msg.OK
                    });
                },                
                scope: this
            });
        } else {
            me.msg("Incorrect Data Entry!");
        }

        Ext.MessageBox.hide();
    },

    deleteRecord: function(btn) {
        var grid = btn.up("gridpanel");
        var store = grid.getStore();
        var row = grid.getSelectionModel().getSelection();
        console.log("number of selected record = ",row.length);
        if (row.length) {
            var record = row[0];
            Ext.MessageBox.confirm('Confirm', 'Are you sure to Delete?', function(btn) {
                if (btn == 'yes') {
                    store.remove(record);
                    store.sync({
                        success: function(batch, options) {
                            Ext.MessageBox.show({
                                title: 'Delete',
                                msg: 'Record has been deleted.',
                                icon: Ext.MessageBox.INFO,
                                buttons: Ext.Msg.OK
                            });
                            store.load();// channa modify

                        },
                        failure: function(batch, options) {
                            store.rejectChanges();
                            var msg = batch.proxy.reader.rawData.message;
                            Ext.MessageBox.show({
                                title: 'Error',
                                msg: msg,
                                icon: Ext.MessageBox.ERROR,
                                buttons: Ext.Msg.OK
                            });
                        },
                        callback: function(batch, options) {

                        },
                        scope: this
                    });


                }
            });
        } else {
            this.msg("Please Select Record To Delete.");
        }
    },

    closeForm: function(btn) {
        var win = btn.up('window');
        Ext.MessageBox.confirm('Confirm', 'Are you sure you want cancel without save?', function(btn) {
            if (btn == 'yes') {
                win.close();
            }
        });
    },

    /*
     * create by Dara 28/09/2014
     * this function create for convert value from combo
     * simple value get from combo box in extjs not obj
     * so we must convert to obj for throw to server side exactly for field have relationship
     */
    convertValueToObj: function(form, listComboName) {
        var values = form.getValues();
        var value = values;
        for (index in listComboName) {
            set(listComboName[index]);
        }

        function set(text) {

            var obj = {};
            var field = form.down('combo[name=' + text + ']');

            if (field) {
                var valueFieldName = field.valueField;
                obj[valueFieldName] = values[text];
                if (!values[text][valueFieldName]) {
                    value[text] = obj;
                }
            } else {
                console.error('Util not found for Combo name =' + text);
            }
        }
        return value;
    },
    loadStore: function(store, param) {
        clearTimeout(myVar);
        if (param.string == "") {
            store.proxy.extraParams = {};
            store.load();
        } else {
            myVar = setTimeout(function() {
                show()
            }, 1000);
        }

        function show() {
            store.proxy.extraParams = param;
            store.load();
            store.loadPage(1);
        }

    },
    search: function(field) {
        var form = field.up('gridpanel'),
            string = form.down('textfield[name=string]').getValue(),
            searchBy = form.down('combo[name=searchBy]').getValue();
        var store = form.getStore();
        Util.loadStore(store, {
            string: string,
            searchBy: searchBy
        });
    },
    parseDate: function(d) {
        var newDate = new Date(d);

        return Ext.Date.format(newDate, 'd-M-Y');
    },
    // get item from store to json data
    getItemStore: function(store) {

        // clear id that generate by extjs
        store.each(function(rec) {
            if (!(rec.get("id") > 0)) {
                rec.data.id = null;
            }
        });

        var storeDetail = store.data.items;
        return Ext.pluck(storeDetail, 'data');
    },

    viewPage: function(treeView, ac) {
        var action = this.lowerCaseFistlatter(ac.get('action'));
        //        var tabPanel=Ext.getCmp('tabpanel');
        this.loadStoreInController(ac.get('action'));
        ExtDesktop.app.getController(ac.get('action'));
        console.log(ac.get("action"))
        var viewPort = treeView.up('window');
        var tabpanel = viewPort.down('tabpanel');
        // get panel for inner tap
        var getPanel = tabpanel.down('grid[action=' + action + ']'),
            panel = tabpanel.down('panel[action=' + action + ']');

        if (getPanel) {
            tabpanel.setActiveTab(getPanel);
        } else if (panel) {
            tabpanel.setActiveTab(panel);
        } else {
            var nameSpace = this.$className;
            var appName = nameSpace.split('.');
            // create panel
            var newPanel = Ext.create(appName[0] + '.view.module.' + action + '.Index', {
                action: action
            });
            tabpanel.add(newPanel).show();
        };
    },
    loadStoreInController: function(action) {
        var controller = ExtDesktop.app.getController(action);
        var stores = controller.stores;
        stores.forEach(function(storeName) {
            var store = Ext.getStore(storeName);
            if (store.autoLoad == false && store.controllerLoad != false) {
                store.load();
            }

		})
	},
	lowerCaseFistlatter: function(string) {
		return string.charAt(0).toLowerCase() + string.slice(1);
	},
    removeGridItem:function(btn){
        var record = Util.getRecord(btn,"Please select record for remove");
        if(record){
            if(record.get('id') > 0){
                record.set("_destroy", true);
            }else{
                var grid=btn.up('grid');
                grid.getStore().remove(record);
                grid.getView().refresh();
            }
        }
    },
    storeSync:function(store , win ){
        var recs = store.getModifiedRecords();
        if (recs.length > 0) {

            Ext.MessageBox.wait("Please System Proccessing Data.....", "Please Wait")
        };
    	
        store.sync({
            success: function(batch, options) {
                Ext.MessageBox.hide();
                if (win) {
	                win.close();
                };
                store.load();
            },
            failure: function(batch, options) {
                store.rejectChanges();
                var msg = batch.proxy.reader.rawData.message;
                Ext.MessageBox.show({
                    title: 'Error',
                    msg: msg,
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });
            },
            scope: this
        });
    },
    sessionTimeOut:function(text){
       
        
        try
        {
           var obj = Ext.decode(text); 
           var success = obj.success; 
        }
        catch(e)
        {
           
        }
        if (success == false ) {
            Ext.MessageBox.show({
                    title: 'Error',
                    msg: obj.message,
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });
        }else{

        	var win = Ext.create('Ext.window.Window',{
                            title:'',
                            width:'100%',
                            height:'100%',
                            closable:'false',
                            layout:'fit',
                            bodyStyle:'background-color:rgb(15, 68, 113)',
                            html:text
                          });
    	      win.show();
    	      win.center()
            
        };

    }
});
window.Util = Ext.create('ExtDesktop.controller.Util');
window.redStar = "(<span style='color:red'>*</span>)"
