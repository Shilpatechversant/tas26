<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <title>Task 25</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body>
    <div class="container">
    <h6 style="background-color:#9d9dbd;">Result: </h6>
    <hr>
        <cfparam name="wordlist">
            <cfset datalist="#wordlist#">
                <cfset words=reMatch("[[:word:]]+", #wordlist#)>
                    <cfset struct_name=StructNew()>
                        <cfloop index="i" array="#words#">
                            <cfif structKeyExists(struct_name, i)>
                                <cfset struct_name[i]++>
                                    <cfelse>
                                        <cfset struct_name[i]=1>
                            </cfif>
                        </cfloop>
                        <cfset sorted=structSort(struct_name, "numeric" , "desc" )>
                            <cfoutput>
                                <cfset sorted=structSort(struct_name, "numeric" , "desc" )>
                                    <div class="res1">
                                        <h3>Word Count List </h3>
                                        <hr>
                                        <table border="1" width="400" class="table table-borded">
                                            <tr>
                                                <th width="50%">Word</th>
                                                <th>Count</th>
                                            </tr>
                                            <cfloop index="word" array="#sorted#">
                                                <cfoutput>
                                                    <tr>
                                                        <td>#word#</td>
                                                        <td>#struct_name[word]#</td>
                                                    </tr>
                                                </cfoutput>
                                            </cfloop>
                                        </table>
                                    </div>
                            </cfoutput>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <p> Ascending Order From Database</p>
                                            <cfquery name="usersList" datasource="newtech"> SELECT * FROM sakila.wordtest ORDER BY tes_word ASC; </cfquery>
                                            <table border="1" class="table table-bordered">
                                                <cfoutput query="usersList">
                                                    <tr>
                                                        <td> #tes_word# </td>
                                                    </tr>
                                                </cfoutput>
                                            </table>
                                        </div>
                                        <div class="col-md-2">                                      
                                                <cfloop collection=#struct_name# item="itm">
                                                    <cfscript> 
                                                     string = "#itm#"; myArray=[];
                                                     result = IsNumeric(string); 
                                                     output = IIF(result eq 1, DE(true),DE(false)); 
                                                     if(output eq "true") StructDelete(struct_name,"#itm#",true); 
                                                     leng=Len(string); if(leng GT 3) { } else { StructDelete(struct_name,"#itm#",true); } 
                                                     </cfscript>
                                                </cfloop>                                          
                                                    <p>Decreasing order of the count of words<br>
                                                     [No Numbers,NO wordlength less than 3]</p>
                                                    <hr>                                                  
                                                    <cfset sortData=StructSort(struct_name,"numeric","desc")>
                                                        <cfoutput>
                                                         
                                                        </cfoutput>
                                                             <table border="1" class="table table-bordered">
                                                        <cfloop array="#sortData#" index="i">
                                                            <cfif isNumeric('#i#') EQ 'NO'>
                                                               
                                                                    <cfif structKeyExists(struct_name, #i#)>
                                                                                                      
                                                            <cfoutput>
                                                                <tr>
                                         <td>-#i# ( #struct_name["#i#" ]#) </td>
                                                                  
                                                                </tr>
                                                            </cfoutput>                                      
                                               
                                                                    </cfif>
                                                        
                                                            </cfif>
                                                        </cfloop>
                                                             </table>


                                    </div>
                         <cfset position=StructNew()>
                        <cfloop index="i" array="#sortData#">
                            <cfset  len=Len(#i#)>
                                <cfset position[i]="#len#">
                                <cfset position[i]++>                                               
                        </cfloop>
                  
                         <cfset sizeData=StructSort(position,"numeric","desc")>
                          <div class="col-md-2">
                              <p>Decreasing order of the lenghth of words<br>
                                                   </p>
                                                    <hr> 
                          <table border="1" class="table table-bordered">
                             <cfloop array="#sizeData#" index="r">       
                             <cfset wlen=len(#r#)-0 >                       
                            <cfoutput>
                            <tr>
                               <cfif #wlen# GT 7> 
                                <h1 style="color:black;">#r#,[#wlen#]</h1><br>
                                </cfif>
                             <cfif #wlen# EQ 7> 
                                <h2 style="color:brown;">#r#,[#wlen#]</h2><br>
                                </cfif>
                              <cfif #wlen# EQ 6>
                                   <h3 style="color:red;">#r#,[#wlen#]</h3><br>
                              </cfif>
                                <cfif #wlen# EQ 5> 
                                <h4 style="color:green;">#r#,[#wlen#]</h4><br>
                                </cfif>
                                <cfif #wlen# EQ 4> 
                                <h5 style="color:blue;">#r#</h5>  <br>
                              </cfif>
                                                                                        
                             </tr>
                           </cfoutput>                     
                            </cfloop>
                             </table>
                              </div>
                              </div>
                              </div>
                                </div>

                                </body>
                                </html>