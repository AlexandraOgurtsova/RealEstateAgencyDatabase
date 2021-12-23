

select /*xml*/ * from client;

select * from client;


create or replace directory UTLDATA AS 'C:/app/';


create or replace procedure ExportClientToXml 
  is
  DOC DBMS_XMLDOM.DOMDocument;                                                                                        
  XDATA  XMLTYPE;                                                                                                                                                                                                                
  CURSOR XMLCUR IS    
    SELECT XMLELEMENT("Clients",    
      XMLAttributes('http://www.w3.org/2001/XMLSchema' AS "xmlns:xsi",                        
      'http://www.oracle.com/Users.xsd' AS "xsi:nonamespaceSchemaLocation"),
      XMLAGG(XMLELEMENT("client",
      xmlelement("id_client", client.id_client),
      xmlelement("full_name", client.full_name),
      xmlelement("mobile", client.mobile),
      xmlelement("address", client.address),
      xmlelement("passport", client.passport)
      ))) from client;
   begin
    open xmlcur;
     loop
       fetch xmlcur into xdata;
      exit when xmlcur%notfound;
    end loop;
    close xmlcur;
      DOC := DBMS_XMLDOM.NewDOMDocument(XDATA);                                                                            
  DBMS_XMLDOM.WRITETOFILE(DOC, 'UTLDATA/clients.xml');
END;

drop procedure ExportClientToXml 

 begin
  ExportClientToXml();
end;



create or replace procedure ImportClientFromXml
IS
  L_CLOB CLOB;
  L_BFILE  BFILE := BFILENAME('UTLDATA', 'client.xml');
  
  L_DEST_OFFSET   INTEGER := 1;
  L_SRC_OFFSET    INTEGER := 1;
  L_BFILE_CSID    NUMBER  := 0;
  L_LANG_CONTEXT  INTEGER := 0;
  L_WARNING       INTEGER := 0;
  
  P                DBMS_XMLPARSER.PARSER;
  v_doc            dbms_xmldom.domdocument;
  v_root_element   dbms_xmldom.domelement;
  V_CHILD_NODES    DBMS_XMLDOM.DOMNODELIST;
  V_CURRENT_NODE   DBMS_XMLDOM.DOMNODE;
   
  cl client%rowtype;
begin
  DBMS_LOB.CREATETEMPORARY (L_CLOB, TRUE);
  DBMS_LOB.FILEOPEN(L_BFILE, DBMS_LOB.FILE_READONLY);
  
  DBMS_LOB.LOADCLOBFROMFILE (DEST_LOB => L_CLOB, SRC_BFILE => L_BFILE, AMOUNT => DBMS_LOB.LOBMAXSIZE,
    DEST_OFFSET => L_DEST_OFFSET, SRC_OFFSET => L_SRC_OFFSET, BFILE_CSID => L_BFILE_CSID,
    LANG_CONTEXT => L_LANG_CONTEXT, WARNING => L_WARNING);
  DBMS_LOB.FILECLOSE(L_BFILE);
  COMMIT;
   P := Dbms_Xmlparser.Newparser;                     
   DBMS_XMLPARSER.PARSECLOB(P,L_CLOB);      
   V_DOC := DBMS_XMLPARSER.GETDOCUMENT(P);
   V_ROOT_ELEMENT := DBMS_XMLDOM.Getdocumentelement(v_Doc);
   V_CHILD_NODES := DBMS_XMLDOM.GETCHILDRENBYTAGNAME(V_ROOT_ELEMENT,'*');
  
   FOR i IN 0 .. DBMS_XMLDOM.GETLENGTH(V_CHILD_NODES) - 1
   LOOP
      V_CURRENT_NODE := DBMS_XMLDOM.ITEM(V_CHILD_NODES,i);
     
      DBMS_XSLPROCESSOR.VALUEOF(V_CURRENT_NODE,
        'id_client/text()',cl.id_client);
      Dbms_Xslprocessor.Valueof(V_Current_Node,
        'full_name/text()',cl.full_name);
      Dbms_Xslprocessor.Valueof(V_Current_Node,
        'mobile/text()',cl.mobile);
      dbms_xslprocessor.valueof(v_current_node,
        'address/text()',cl.address);
      DBMS_XSLPROCESSOR.VALUEOF(V_CURRENT_NODE,
        'passport/text()',cl.passport);
      
      insert into client(id_client, full_name, mobile, address, passport) 
        values(cl.id_client, cl.full_name, cl.mobile, cl.address, cl.passport);
   end loop;
  
  DBMS_LOB.FREETEMPORARY(L_CLOB);
  DBMS_XMLPARSER.FREEPARSER(P);
  DBMS_XMLDOM.FREEDOCUMENT(V_DOC);
  commit;
END;

drop procedure ImportClientFromXml;

begin
  ImportClientFromXml();
end;

select * from client where id_client=99945;
    
select count(*) from client;