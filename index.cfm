<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href = "css/style.css">
              <title>Task 25</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body style="background-color:#9d9dbd;">
<div class="container" style="margin-top:10px;">
  <div class="col-md-12">
   <div class="col-md-4 col-md-offset-4">
         <h4>Task 26</h4>
<cfform method='post' action="" enctype="multipart/form-data" name="img_form" class='col-lg-6 offset-lg-3'>
  
  <div class="form-group">
    <label for="exampleInputEmail1" >Upload File</label>
   <div class='col-sm-6'>
    <cfinput type='file' name='doc_file' accept='.doc,.txt,.pdf'>
  </div> 
     
            <div class="col-md-12">                     
        		<input class="btn btn-sm btn-primary"	type="submit"	value="submit"   name="Submit"	/>
           </div>
     </div>
    </cfform>
    </div>               
<cfif structKeyExists(form, "Submit")>

    <cfset thisDir = expandPath("./uploads")>
    <cfif len(trim(form.doc_file)) >
            <cffile action="upload" fileField="form.doc_file"  destination="#thisDir#" result="fileUpload"
            nameconflict="overwrite">

            <cfset file_name=#fileupload.serverfile# >
         
            <cfset fileLoc=fileupload.serverDirectory & '\' & fileupload.serverfile >
      
         
            <cffile action="read" file="#fileLoc#" variable="Contents">
            <cfset wordData=createObject("component", "components.tagCloud")>
            <cfset structData=wordData.init(#Contents#)>

            <cfset skeys=structKeyList(structData)>

            <cfloop list="#skeys#" index="i">
            

            <cfquery name="word" datasource="read_data">
            INSERT INTO read_data.read_count(word_name) VALUES('#i#' )
            </cfquery>
            </cfloop>
            <cflocation url="list.cfm?wordlist='#Contents#">  
             <cfelse>
            <cfoutput>'<script>alert('Please Upload File!')</script>'
            </cfoutput>
    </cfif>

</cfif>
</div>
</body>
</html>




