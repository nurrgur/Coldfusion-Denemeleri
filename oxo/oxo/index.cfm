<cfoutput>Merhaba dunya <br> </cfoutput>                  <!--Çıktı yazdırma -->


<cfinclude template="login.cfm">                          <!--Başka bir sayfayı ekleme -->


<cfscript>                                                 //Script ile yazma
    //tek satir yorum
    /*blok yorum satırı */
    msg="Merhaba";
    writeOutput(msg);
    
</cfscript>
<hr>
<cfoutput>                                                <!--Referans değerini ekrana bastırma -->
<div>
#msg#
</div>
</cfoutput>
<hr>

<cfdump var="#msg#"></cfdump>                             <!--Referans değerini ekrana bastırma -->

<hr>
                      <!-- DEĞİŞKEN TANIMLAMA (SCRIPT VE TAG İLE)-->

<cfset oxo="deneme">
<cfset oxo=25>
<cfset training=#oxo#>

<cfoutput>#oxo# <br> #training# <br></cfoutput>

<cfdump var="#oxo#"></cfdump>


<cfscript>                                               //script ile değişken tanımlama

    oxo="script"

</cfscript>
<cfdump var="#oxo#"></cfdump>

<cffunction name="Test">                                 //function içinde tanımlama

    <cfset oxo="function">

</cffunction>

<cfdump var="#Test#"></cfdump>

                                        <!--LİSTE OLUŞTURMA-->
    
<hr>
    <cfset liste="1,2,ahmet,mehmet">                     <!--Liste string olarak oluşturulur ancak daha sonradan veri tipleriyle oynanabilir. -->

    <cfoutput>
    <br>
     #liste#
     <br>
    #ListLen(liste)#                                     <!--Liste boyutunu bastırır-->
    </cfoutput>



                         <!--Dizi OLUŞTURMA (0.eleman yok 1 le başlıyor!!)--> 
<hr>

    <cfset ornek=arraynew(1)>
    <cfset ornek[1]="ali">
    <cfset ornek[2]="veli">

    <cfdump var="#ornek#">
    <cfdump var="#ornek[1]#">


<hr>
                                            <!--Structure OLUŞTURMA--> 

    <cfset str="referans">

    <cfset obje=structNew()>  
    <cfset obje1={}>


      <cfset obje.ad="nur">  
      <cfset obje["ad"]="burcu"> 
      <cfset obje.info=#str#> 
      
      <cfdump var="#obje#">
      <br>
      <cfdump var="#obje.ad#">
      <br>
      <cfdump var="#obje.info#">



      <cfscript>                                 //script ile structure oluşturma
      
       test=structNew();
       test={};

      </cfscript>
<br>
<hr>
                                            <!--KOŞULLU İFADELER--> 

    <cfset sayi=25>

    <cfif sayi EQ 26>                                                   <!--EQ eşit mi? NEQ eşit değilse-->
        <cfdump var="sayi 25 e eşit">
    <cfelseif sayi EQ 28>
        <cfdump var="sayi 28 e eşit">
        <cfelse>                                                        <!-- else if taginin içinde yer alır-->
             <cfdump var="sayi 26 ya esit degildir">
    </cfif>
    <br>




    <cfscript>                                                           //script de if kullanımı
    
    if(sayi==26){

        writeDump(sayi & "sayisidir")            //peş peşe string eklemek için + yerine & işareti kullanılır.
    }
    else if(sayi==28){
        writeDump("sayi 28 e esittir")
    }
    else{
        writeDump("sayi 26 değildir(script içi)")  
    }
    </cfscript>


                                            <!--SWITCH CASE--> 
<br>
    <cfset sayi=10>
    <cfswitch expression=#sayi#>
    <cfcase value="1">
        <cfdump var="sayının değeri 1"></cfdump>
    </cfcase>
    <cfcase value="2">
        <cfdump var="sayının değeri 2"></cfdump>
    </cfcase>
    <cfcase value="3">
        <cfdump var="sayının değeri 3"></cfdump>
    </cfcase>
    <cfdefaultcase>
        <cfdump var="sayının değeri caseler disinda"></cfdump>
    </cfdefaultcase>
    </cfswitch>
<br>

    <cfscript>
        switch(sayi){
            case 1: writeDump("sayi 1");break;
            case 2: writeDump("sayi 2");break;
            case 3: writeDump("sayi 3");break;
            case 4: writeDump("sayi 4");break;
            default: writeDump("sayi bulunamadi");
        }
    
    </cfscript>

                                            <!--DÖNGÜLER--> 

    <br>
    <cfloop index ="sayi" from="1" to="10" step="2">         <!-- step kaç arttırılacağını belirtir. default değeri 1 dir.-->
    
        <cfdump var="#sayi#"></cfdump>

    </cfloop>
    <br>
     <!--********************Döngü ile listede dolaşma*********************--> 
    
    <cfset liste="ahmet,mehmet">                  
    <cfloop index="item" list="#liste#">                   <!--1.yol--> 
        <cfdump var=#item#><br>
    </cfloop>


     <cfloop index="item" list="ahmet,mehmet">              <!--2.yol--> 
        <cfdump var="item degeri #item#"><br>
    </cfloop>
<hr>
    <!--********************Döngü ile dizide dolaşma*********************--> 

    <cfset dizi=["ayşe","nur","merve"]>

    <cfloop index="item" array="#dizi#">                   
        <cfdump var=#item#><br>
    </cfloop>
    <hr>
                                      <!--Script ile döngü oluşturma--> 

    <cfset dizi2=["semih","ali","akif"]> 
    <cfscript>
        for(j=1 ; j <= arrayLen(dizi2); j++){
               writeOutput("#dizi2[j]# ");
            }
    </cfscript>
<br>
<hr>
                                            <!--FONKSİYONLAR--> 


    <cffunction name="getFullName" output="false" access="public" returnType="string">  <!--return donuyorsa returntype mutlaka olmalı. -->
    <cfargument name="firstName" type="string" required="false" default="" />             <!--Argümanlarda name ve type girilsede olur. -->
    <cfargument name="lastName" type="string" required="false" default="" />  <!--Eger fonk. çağırıldığında bu parametre girilmezse default a yazılan deger atanir -->
 
    <cfset var fullName = arguments.firstName & " " & arguments.lastname />
    
        <cfreturn fullName />
    </cffunction>
    
    <cfset fullName = getFullName(firstName="John", lastName="Adams") />
    
    <cfoutput>
        Good morning, #fullName#!
    </cfoutput>

    <!-- ---------------------------------------------------------------------------- -->





        
    