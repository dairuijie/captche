package com.netease.is.nc.sdk;
/**
 * 

* <p>Title: NESecretPair</p>  

* <p>Description: 秘钥对 通过网易云盾平台申请获取 </p>  

* @author dairuijie  

* @date 2018年4月1日
 */

public class NESecretPair {
    public final String secretId;
    public final String secretKey;

    /**
     * 构造函数
     * @param secretId 密钥对id
     * @param secretKey 密钥对key
     */
    public NESecretPair(String secretId, String secretKey) {
        this.secretId = secretId;
        this.secretKey = secretKey;
    }
}
