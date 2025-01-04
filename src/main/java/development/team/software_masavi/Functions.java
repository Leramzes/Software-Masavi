package development.team.software_masavi;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Functions {
    //Validations for contact us page
    private static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@(gmail\\.com|hotmail\\.com|utp\\.edu.pe)$";
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);
    private static final String PHONE_REGEX = "^9\\d{8}$";
    private static final Pattern PHONE_PATTERN = Pattern.compile(PHONE_REGEX);

    private boolean isValidMail(String correo, Pattern pattern) {
        Matcher matcher = pattern.matcher(correo);
        return matcher.matches();
    }
    private boolean isValidCelphone(String telf, Pattern pattern) {
        Matcher matcher = pattern.matcher(telf);
        return matcher.matches();
    }
    public String isProceedMail(String namePerson, String email, String phone, String msg) {
        if (!isValidMail(email, EMAIL_PATTERN) || email.isEmpty()) {
            return "EMAIL";
        }
        if (!isValidCelphone(phone, PHONE_PATTERN) || phone.isEmpty()) {
            return "PHONE";
        }
        if (namePerson.isEmpty()) {
            return "NAME";
        }
        if (msg.isEmpty()) {
            return "MESSAGE";
        }
        return "SUCCESS";
    }

}
