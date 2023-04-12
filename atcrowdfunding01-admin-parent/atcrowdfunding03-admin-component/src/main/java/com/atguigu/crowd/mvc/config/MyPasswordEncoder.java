package com.atguigu.crowd.mvc.config;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Objects;

@Component
public class MyPasswordEncoder implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        return privateEncode(rawPassword);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        // 1.对明文密码进行加密
        String formPassword = privateEncode(rawPassword);
        // 2.声明数据库密码
        String databasePassword = encodedPassword;

        // 3.比较
        return Objects.equals(formPassword, databasePassword);
    }

    private String privateEncode(CharSequence rawPassword) {
        try {
            // 1.创建 MessageDigest 对象
            String algorithm = "MD5";
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            // 2.获取 rawPassword 的字节数组
            byte[] input = ((String) rawPassword).getBytes();
            // 3.加密
            byte[] output = messageDigest.digest(input);
            // 4.转换为 16 进制数对应的字符
            String encoded = new BigInteger(1, output).toString(16);
            return encoded.toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}