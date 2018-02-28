//Below class updates the Invoice__c object records using Databse.update() method

public class DatabaseUpdate{

public static void updateInvoice{
List<APEX_Invoice__c> lstInvoiceToUpdate = new List<APEX_Invoice__c>();

List<APEX_Invoice__c> fetchedInvoice = [Select id, Name, APEX_Status__c  from APEX_Invoice__c];

for(APEX_Invoice__c inv:fetchedInvoice)
{
    if(inv.APEX_Status__c !='Paid')
    {
        inv.APEX_Status__c='Paid';
        lstInvoiceToUpdate.add(inv);
    }
}
Database.SaveResult[] srList=  Database.update(lstInvoiceToUpdate, false);
for(Database.SaveResult sr: srList){
    if(sr.isSuccess()){
        System.debug('Record sucees '+ sr.getId());
    }
    else
    {
        for(Database.Error er:sr.getErrors()){
            System.debug('Errrors are '+ er.getMessage());
            System.debug('Failed fields are '+ er.getFields());
        }
    }
}
}
}
