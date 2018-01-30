public class OppertunityList2Con{
    //ApexPages.StandardSetController must be initiated
    //for standard list controllers
    
    public ApexPages.StandardSetController SetCon{
        get
        {
            if(SetCon == null)
            {
                SetCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, CloseDate FROM Opportunity]));
            }
        return SetCon;
        }
        set;
    }
    
    public List<Opportunity> getOpportunities(){
        return (List<Opportunity>) SetCon.getRecords();
    } 
    
}