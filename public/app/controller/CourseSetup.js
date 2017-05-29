Ext.define('ExtDesktop.controller.CourseSetup', {
    extend: 'Ext.app.Controller',
    stores: [
            'DegreeCourseStore',
            'CourseSubjectStore',
            'Subject',
            'CourseTCStore',
            'CourseWUStore'
  
    ],
    views: [
        'module.courseSetup.Index',
        'module.courseSetup.winSubjectSearch',
        'module.courseSetup.winCourseTCSearch',
        'module.courseSetup.winCourseWUSearch',
        'module.courseSetup.CoursesListTC',
        'module.courseSetup.CoursesListWU',
        'module.courseSetup.SubjectList'
     

    ],
    
    init: function(app) {
        
        this.control({
            'courseSetup button[action=ShortCourse]':{
                click:this.loadShortCourse
            },
            'courseSetup button[action=EnglishCourse]':{
                click:this.loadEnglishCourse
            },

            'courseSetup button[action=Associate]':{
                click:this.loadAssociate
            },
            'courseSetup button[action=Bachelor]':{
                click:this.loadBachelor
            },
            'courseSetup button[action=Master]':{
                click:this.loadMaster
            },
            'courseSetup button[action=Doctor]':{
                click:this.loadDoctor
            },

            // fucnction on click add button on course or subject
            'courseSetup button[action=AddCourse]':{
                click: this.addCourse
            }, 
            'courseSetup button[action=AddSubject]':{
                click: this.addSubject
            }, 
            'courseSetup grid[name=course]':{
                itemclick: this.loadSubject
            },

            'WindowCourse GridCourse':{  // access to Window and The Grid view in that window
                itemdblclick:this.addSearchedCourse
            },

            'WindowSubject GridSubject':{  // access to Window subject and The Grid view in that window 
                itemdblclick:this.addSearchedSubject
            },
            'WindowCourse textfield[name=keywordWU]':{  // access to Window course and text field name keywordWU
                change:this.searchCourseWU
            },
            'WindowCourse textfield[name=keywordTC]':{  // access to Window course and text field name keywordTC
                change:this.searchCourseTC
            },
            'WindowSubject textfield[name=keyword]':{  // access to Window subject and text field name keyword
                change:this.searchSubject
            },
            // ######### Event when user click on buttton ok when add course or subject
            'WindowCourse button[action=addCourseTC]':{  // access to Window subject and text field name keyword
                click:this.addCourseBtnOk
            },
            'WindowCourse button[action=addCourseWU]':{  // access to Window subject and text field name keyword
                click:this.addCourseBtnOk
            },
            'WindowSubject button[action=addSubject]':{  // access to Window subject and text field name keyword
                click:this.addSubjectBtnOk
            }




        });        
        
    },
    tmpDegreeId: null , 
    tmpCourseId: null , 
    tmpDegreeCourseId:null,
    tmpCourseSubjectId:null,
    
    loadAssociate:function(btn){        
        this.laodStore(3 , this);
        this.tmpDegreeId =3;
        this.tmpCourseId= null ;   // set course id to null , so that when use click on add subject without click course first => alert warning
    },
    loadBachelor:function(btn){
        this.laodStore(4 , this);  
        this.tmpDegreeId =4; 
         this.tmpCourseId= null ;   // set course id to null , so that when use click on add subject without click course first => alert warning     
    },
    loadMaster:function(btn){

        this.laodStore(5 , this);  
        this.tmpDegreeId =5;  
         this.tmpCourseId= null ;   // set course id to null , so that when use click on add subject without click course first => alert warning            
    },
    loadDoctor:function(btn){

        this.laodStore(6 , this); 
        this.tmpDegreeId =6;  
         this.tmpCourseId= null ;   // set course id to null , so that when use click on add subject without click course first => alert warning             
    },
    

    loadShortCourse:function(btn){
        this.laodStore(2,this);
        this.tmpDegreeId = 2;
        this.tmpCourseId= null ;
    },
    loadEnglishCourse:function(btn){
        this.laodStore(1,this);  // 1 is the id of english course in table acd_degree
        this.tmpDegreeId = 1;
        this.tmpCourseId= null ;
    },
    laodStore:function(id, me){
        
        var store = me.getDegreeCourseStoreStore();
        me.getCourseSubjectStoreStore().removeAll();
        store.load({
            params:{
                degree_id : id
            }
        });
    }  ,
    
    removeCourse:function(grid, rowIndex){

        var subjectStore = this.getCourseSubjectStoreStore();
        Ext.MessageBox.confirm('Remove Course?', 'Are you sure to <b>remove this Course </b>?', 
            function(btn ){                
                if (btn == 'yes') {
                    remove()
                };
            });
       

        function remove(){

            var store =grid.getStore(); 
            var rec = store.getAt(rowIndex);

            var id = rec.data.degree_course_id ;
            var c_id = rec.data.course_id;
  

            if (id > 0 ) {
                // remove course in server side , and subject also 
                Util.ajax('AcdDegreeSetup/removeCourse',{id: id , course_id:c_id}); // id is the value of id in table AcdDegreeCourse which match degree and course

            } 
           
            store.remove(rec);   // remove record from store course

             subjectStore.removeAll();  // remove all record from store subject

          
        }
        
        
    },
    loadSubject:function(grid, rec){
        var id = rec.data.course_id;  // this is course id
        var me = this;
        me.tmpDegreeCourseId = rec.data.degree_course_id;  // this is id of corresponding course id and degree id
        me.tmpCourseId = id ;

        this.getCourseSubjectStoreStore().load({
            params:{
                course_id : id , /*me.tmpDegreeStandardId*/   
                degree_course_id: me.tmpDegreeCourseId              
            }
        });
    },
    removeSubject:function(grid, rowIndex){
         Ext.MessageBox.confirm('Remove subject?', 'Are you sure to <b>remove this Subject </b>?', 
            function(btn ){
                
                if (btn == 'yes') {
                    remove()
                };
            });
 
        function remove(){

            var store =grid.getStore(); 
            var rec = store.getAt(rowIndex);

            var id = rec.data.acd_course_subject_id;
            if (id > 0 ) {
                    // remove subject in server side
                Util.ajax('AcdDegreeSetup/removeSubject',{id:id});


            } 

            store.remove(rec);

        }


    },

    addSearchedCourse:function(grid,rec){
            var me = this;

            var c_id = rec.data.id;
            var record = rec  ;

            var courseStore = grid.store;  // get course store from window search course
            if (c_id > 0) { // test if we can get course id
               
                var degreeCourseStore = this.getDegreeCourseStoreStore();
                var is_exist = false ;
                    // check if the course is already of in that degree
                degreeCourseStore.each(function(rec){
                    if (rec.data.name == record.data.name) { 
                        is_exist = true ;
                    };
                });            

                if (is_exist) {
                    Ext.Msg.alert("Warning", "This course is already exist");   
                    return 0 ;
                };
                    // Creating model and add to store (add all the field in model,client)
                var model = Ext.create('ExtDesktop.model.DegreeCourseModel', {
                    degree_id: this.tmpDegreeId,  // this is id of degree of current selected. Cus when we select degree we store its id in tmpDegreeId variable
                    course_id: record.data.id,
                    code: record.data.code,
                    name: record.data.name,
                    abbr: record.data.abbr
                });
                
                grid.up('window').close()
                degreeCourseStore.add(model);  // add data to store
                Util.ajax("AcdDegreeSetup/addDegreeCourse",{ degree_id: this.tmpDegreeId , course_id: record.data.id }); // pass parameter to server course_id,degree_id in order to insert to table AcdDegreeCourse
                this.laodStore(this.tmpDegreeId ,this);  // load data from server

                Ext.Msg.alert("Adding course", "Course is added successfully");   
                    
                
            };

    },
    addCourse:function(btn){
 

        if (this.tmpDegreeId != null){
            if(this.tmpDegreeId == 1 || this.tmpDegreeId ==2 ) { // create TC course search window
                 var course = Ext.create('ExtDesktop.view.module.courseSetup.WinCourseTCSearch') ;
            }else{
                var course = Ext.create('ExtDesktop.view.module.courseSetup.WinCourseWUSearch') ;
            }         
            course.show();
        }else{
            Ext.Msg.alert("Adding course", "Please select a degree before adding course!");
        }

    },

    // #########################
    addSubject:function(btn){
         if (this.tmpCourseId != null  && this.tmpDegreeId!=null){

            var subject = Ext.create('ExtDesktop.view.module.courseSetup.WinSubjectSearch') ;
            subject.show();
        }else{
            Ext.Msg.alert("Adding subject", "Please select a course before adding subject!");
        }
       
    },
    addSearchedSubject:function(grid,rec){

        var me = this;
        var s_id = rec.data.id;
        var record = rec  ;

        //var courseStore = grid.store;  // get course store from window search course
        var subjectStore = grid.store;
        if (s_id > 0) { // test if we can get subject id
           
            var courseSubjectStore = this.getCourseSubjectStoreStore();
            var is_exist = false ;
                // check if the course is already of in that degree
            courseSubjectStore.each(function(rec){
                if (rec.data.name == record.data.name) { 
                    is_exist = true ;
                };

            });            

            if (is_exist) {
                Ext.Msg.alert("Warning", "This subject is already exist");   
                return 0 ;
            };
                // Creating model and add to store (add all the field in model,client)
            var model = Ext.create('ExtDesktop.model.CourseSubjectModel', {
                acd_course_id: this.tmpCourseId,  // this is id of degree of current selected. Cus when we select degree we store its id in tmpDegreeId variable
                acd_subject_id: record.data.id, 
                degree_course_id: this.tmpDegreeCourseId,
                code: record.data.code,
                name: record.data.name
                      
            });
            grid.up('window').close()

            courseSubjectStore.add(model);  // add data to store
            Util.ajax("AcdDegreeSetup/addCourseSubject",{ course_id: this.tmpCourseId , subject_id: record.data.id , degree_course_id: this.tmpDegreeCourseId }); // pass parameter to server course_id,subject_id in order to insert to table AcdDegreeCourse
            
            Ext.Msg.alert("Adding course", "Course is added successfully");   
                
            
        };
        

    },
            // ######### Search courses
    searchCourseTC:function(textfield,newVal,oldVal){

        var text_search = newVal ;
        var store = this.getCourseTCStoreStore();
        var me =  this;
        setTimeout(function() {
          me.show(text_search,store)
        }, 1000);  // measure in millisecond (ms)
       
    },
    searchCourseWU:function(textfield,newVal,oldVal){

        var text_search = newVal ;
        var store = this.getCourseWUStoreStore();
        var me =  this;
        setTimeout(function() {
          me.show(text_search,store)
        }, 1000);  // measure in millisecond (ms)
        
    },
    
    show:function(text_search,store){
        if (text_search != ""){   // user input value 
             store.load({  params: {keyword : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
          
        }else{
            store.load();       
        }
    },
    searchSubject:function(textfield,newVal,oldVal){

        var text_search = newVal ;
        var store = this.getSubjectStore();
        var me =  this;

        setTimeout(function() {
          if(text_search!=""){
                store.load({params: {search: text_search}});  // because i use the store of subject and that store uses acd_subjects_controler , where its index action need parameter  named search. (check the acd_subjects_controller)
          }else{
                store.load();
          }

        }, 1000);  // measure in millisecond (ms)
        
    }
    ,  
    // ############ event when click button ok
    addCourseBtnOk:function(btn){
        rec = Util.getRecord(btn , "Please select record ")
        if (rec) {
            grid = btn.up('grid')
            this.addSearchedCourse(grid,rec);
        }

       
    },
    addSubjectBtnOk:function(btn){
        rec = Util.getRecord(btn , "Please select record ")
        if (rec) {
            grid = btn.up('grid')
            this.addSearchedSubject(grid,rec);
     
        }
      
        
       
    },
    removeCourseStore:function(){
        this.getDegreeCourseStoreStore().removeAll();
    },
    removeSubjectStore:function(){
        this.getCourseSubjectStoreStore().removeAll();
    }
});

