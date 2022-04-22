	<cfif NOT len(trim(form.datas)) EQ 0>
		<cfquery  datasource="newtech" result="outputstring">
            SELECT * FROM sakila.email_check WHERE email = "#form.datas#"
        </cfquery>
        <cfif outputstring.RECORDCOUNT GT 0>
        	<!---<cfoutput>#serializeJSON('found')#</cfoutput>--->
        	<cfoutput>found</cfoutput>
        <cfelse>
        	<!---<cfoutput>#serializeJSON('not_found')#</cfoutput>--->
        	<cfoutput>not_found</cfoutput>
        </cfif>
	<cfelse>
		<!---<cfoutput>#serializeJSON('not_found')#</cfoutput>--->
		<cfoutput>not_found</cfoutput>
	</cfif>