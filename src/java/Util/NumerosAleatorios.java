package Util;

import java.util.Random;

public class NumerosAleatorios{
    private static int randomNum() {
        Random r = new Random();
        int aleatorio = r.nextInt(9) + 1;
        return aleatorio;
    }

    private static char randomLetraMinus() {
        char a;

        Random r = new Random();
        double aleatorio = Math.floor(Math.random() * (122 - 97 + 1) + 97);

        a = (char) aleatorio;

        return a;
    }

    private static char randomLetraMayus() {
        char a;

        Random r = new Random();
        double aleatorio = Math.floor(Math.random() * (90 - 65 + 1) + 65);

        a = (char) aleatorio;

        return a;
    }

    public String getCodigo(int tamano) {
        char letra;
        String codigo = "";
        //String codigos[] = new String[filas];
        int num, aleatorio;
        Random r = new Random();
        //for (int j = 0; j < filas; j++) {
            for (int i = 1; i <= tamano; i++) {                
                aleatorio = r.nextInt(3) + 1;
                if (aleatorio == 1) {
                    num = randomNum();
                    codigo += String.valueOf(num);
                }
                if (aleatorio == 2) {
                    letra = randomLetraMinus();
                    codigo += String.valueOf(letra);
                }
                if (aleatorio == 3) {
                    letra = randomLetraMayus();
                    codigo += String.valueOf(letra);
                }
            }
//            codigos[j] = codigo;
//            codigo ="";
//        }
        return codigo;
    }

//    public static void main(String[] args) {
//        NumerosAleatorios na = new NumerosAleatorios();
//        System.out.println(Arrays.toString(na.getCodigo(20,5)));
//    }
}
