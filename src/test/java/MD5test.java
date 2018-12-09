import com.oraclewdp.ddbookmarket.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class MD5test {
public static void main(String[] args) throws Exception {
   String str="admin";
    System.out.println(MD5Util.getEncryptedPwd(str));
}
}
