package vn.edu.hcmuaf.fit.Format;


import javax.swing.text.NumberFormatter;
import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormat {

    public String format(int price) {
        String priceString = price + "";
        Locale VN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(VN);
        return currencyVN.format(price);

    }

    public static void main(String[] args) {
        System.out.println(new CurrencyFormat().format(100));
        System.out.println(new CurrencyFormat().format(1000));
        System.out.println(new CurrencyFormat().format(10000));
    }
}
