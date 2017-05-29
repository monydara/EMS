Ext.define('Ext.ux.Form', {
    extend: 'Ext.form.Panel',
    alias: 'widget.Form',
    initComponent: function() {
        this.on('beforeadd', function(me, field){
            if (!field.allowBlank)
                field.labelSeparator += '<span style="color: rgb(255, 0, 0); padding-left: 2px;">*</span>';
        });
        this.callParent(arguments);
    }
});