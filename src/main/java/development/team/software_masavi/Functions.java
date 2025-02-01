package development.team.software_masavi;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    public static Date fechaFormateada(String fechaStr){
        java.sql.Date fechaSQL = null;
        try {
            // Convertir de String a java.util.Date
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("d/M/yyyy"); // Formato de entrada
            java.util.Date fechaUtil = formatoEntrada.parse(fechaStr);

            // Convertir de java.util.Date a java.sql.Date en formato yyyy-MM-dd
            SimpleDateFormat formatoSalida = new SimpleDateFormat("yyyy-MM-dd"); // Formato de salida
            String fechaFormateada = formatoSalida.format(fechaUtil);

            // Convertir a java.sql.Date para la base de datos
            fechaSQL = java.sql.Date.valueOf(fechaFormateada);

            System.out.println("Fecha en formato correcto: " + fechaSQL); // Output: 2025-02-01

        } catch (ParseException e) {
            System.err.println("Error al parsear la fecha: " + e.getMessage());
        }
        return fechaSQL;
    }
    public static String formatFechaComprobante(String fechaStr){
        String[] partes = fechaStr.split("/");

        String dia = partes[0];
        String mes = partes[1];
        String año = partes[2];

        if (dia.length() == 1) {
            dia = "0" + dia;  // Por ejemplo, "1" se convierte en "01"
        }
        if (mes.length() == 1) {
            mes = "0" + mes;  // Por ejemplo, "1" se convierte en "01"
        }

        return dia + mes + año;
    }

}
