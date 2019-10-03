public class BasicClassesController {

    public String getUserFirstName() {
        return UserInfo.getFirstName();
    }

    public String getUserLastName() {
        return UserInfo.getLastName();
    }

    public String getUserId() {
        return UserInfo.getUserId();
    }

    public String getCurrentCurrency() {
        return UserInfo.getDefaultCurrency();
    }

    public String getUserEmail() {
        return UserInfo.getUserEmail();
    }

    public String getOrgName() {
        return UserInfo.getOrganizationName();
    }
    public String getToday() {
        return String.valueOf(System.today());
    }

    public Integer getLeftQueries() {
        return Limits.getLimitQueries() - Limits.getQueries();
    }
}