public class NewAndExistingController{
    public Account account {get;private set;}
    
    public NewAndExistingController()
    {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() : [SELECT Name, Phone, Industry FROM Account where Id =: id];
    }
    
    public PageReference save()
    {
        try
        {
            upsert account;
        }
        catch(System.DmlException e)
        {
            ApexPages.addMessages(e);
            return null;
        }
        //hey
            // After successfull save return to the default view page
            PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
            return redirectSuccess;
    }
}