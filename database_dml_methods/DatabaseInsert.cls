// Below class shows how to call Database.Insert() method and how to do further processing on the results returned by this method

public class UdateInvoice {
    
public static void updateData(){
    
Customer_APEX__c cust= new Customer_APEX__c(Name='Test');
insert cust;
List<APEX_Invoice__c> lstInvoice = new List<APEX_Invoice__c>();

APEX_Invoice__c invoice1 = new APEX_Invoice__c();
invoice1.APEX_Amount_Paid__c = 1000;
invoice1.APEX_Customer__c = cust.Id;
invoice1.APEX_Status__c  = 'Pending';
lstInvoice.add(invoice1);

APEX_Invoice__c invoice2 = new APEX_Invoice__c();
invoice1.APEX_Amount_Paid__c=1200;
invoice1.APEX_Customer__c=cust.Id;
invoice1.APEX_Status__c  = 'Pending';
lstInvoice.add(invoice2);

Database.SaveResult[] srList = Database.insert(lstInvoice, false);
for(Database.SaveResult sr : srList){
    if(sr.isSuccess())
    { System.debug('Inseert is success '+ sr.getId());
		}
    else
    {
       for(Database.Error errorObj : sr.getErrors())
       {  
           System.debug('Error s '+ errorObj.getMessage());
           System.debug('Fields affecting '+ errorObj.getFields());
		}
    }
        
}
    }
}

// Call this class as below

UdateInvoice updateInvoice = new UdateInvoice();
updateInvoice.updateData();
