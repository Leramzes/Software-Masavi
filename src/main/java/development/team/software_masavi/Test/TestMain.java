package development.team.software_masavi.Test;

import development.team.software_masavi.Services.Auth;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestMain {
    public static void main(String[] args) {
        String fechaStr = "1/2/2025"; // Fecha en formato "d/M/yyyy"

        try {
            // Convertir de String a java.util.Date
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("d/M/yyyy"); // Formato de entrada
            Date fechaUtil = formatoEntrada.parse(fechaStr);

            // Convertir de java.util.Date a java.sql.Date en formato yyyy-MM-dd
            SimpleDateFormat formatoSalida = new SimpleDateFormat("yyyy-MM-dd"); // Formato de salida
            String fechaFormateada = formatoSalida.format(fechaUtil);

            // Convertir a java.sql.Date para la base de datos
            java.sql.Date fechaSQL = java.sql.Date.valueOf(fechaFormateada);

            System.out.println("Fecha en formato correcto: " + fechaSQL); // Output: 2025-02-01

        } catch (ParseException e) {
            System.err.println("Error al parsear la fecha: " + e.getMessage());
        }
    }
}
