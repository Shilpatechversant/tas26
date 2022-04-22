<cfcomponent accessors="TRUE">
<cfproperty name="textP" type="string" setter="true"/> 
<cffunction name="init" acceess="public" > 
<cfargument name="textdata"/> 
<cfset out_words = reMatch("[[:word:]]+", textdata)>
<cfset struct_name = StructNew()> 
<cfloop index="i" array="#out_words#"> 
    <cfif structKeyExists(struct_name, i)> 
    <cfset struct_name[i]++> 
    <cfelse> 
    <cfset struct_name[i] = 1> 
    </cfif> 
</cfloop>
<cfoutput>
 <cfset sorted = structSort(struct_name, "numeric", "desc")>
 <div class="res1" >
 <h3>Word Count List </h3>
 <hr>
<table border="1" width="400" class="table table-borded"> <tr> <th width="50%">Word</th> <th>Count</th> </tr>
<cfloop index="word" array="#sorted#">
 <cfoutput> <tr> <td>#word#</td> <td>#struct_name[word]#</td> </tr> 
 </cfoutput> 
 </cfloop>
</table>
</div>
</cfoutput>

 <cfloop collection=#struct_name# item="itm">
     <cfscript>
    string = "#itm#";
    result = IsNumeric(string);
    output = IIF(result eq 1, DE(true),DE(false));
          if(output eq "true")
      StructDelete(struct_name,"#itm#",true);
    </cfscript>
 </cfloop>
 
<cfquery name="getdata"  datasource="newtech" result="resd1">
select * FROM sakila.wordtest
</cfquery>
 <cfloop query=#getdata#>      
        <cfif structKeyExists(struct_name,#tes_word#)>
        <cfscript>StructDelete(struct_name,"#tes_word#",true);</cfscript>
        </cfif>
 </cfloop>
<cfloop collection=#struct_name# item="itm"> 
<cfquery name="insertdata"  datasource="newtech">
INSERT INTO sakila.wordtest(tes_word) VALUES('#itm#')
</cfquery>
 </cfloop>
 <cfreturn struct_name>
</cffunction>
</cfcomponent>