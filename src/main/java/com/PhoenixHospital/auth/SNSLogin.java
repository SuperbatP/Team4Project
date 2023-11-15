package com.PhoenixHospital.auth;

import java.util.Iterator;

import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {

    private OAuth20Service oauthService;
    private SnsValue sns;

    public SNSLogin(SnsValue sns) {
        this.oauthService = new ServiceBuilder(sns.getClientId())
                .apiSecret(sns.getClientSecret())
                .callback(sns.getRedirectUrl())
                .scope("profile")
                .build(sns.getApi20Instance());

        this.sns = sns;
    }

    public String getNaverAuthURL() {
        return this.oauthService.getAuthorizationUrl();
    }

    public MemberVO getUserProfile(String code) throws Exception {
        OAuth2AccessToken accessToken = oauthService.getAccessToken(code);

        OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
        oauthService.signRequest(accessToken, request);

        Response response = oauthService.execute(request);
        return parseJson(response.getBody());
    }

    private MemberVO parseJson(String body) throws Exception {
        System.out.println("============================\n" + body + "\n==================");
        MemberVO member = new MemberVO();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(body);

        if (this.sns.isGoogle()) {
            String id = rootNode.get("id").asText();
            if (sns.isGoogle())
                member.setGoogleid(id);
            //  member.setNickname(rootNode.get("displayName").asText());
            JsonNode nameNode = rootNode.path("name");
            String uname = nameNode.get("familyName").asText() + nameNode.get("givenName").asText();
            member.setMemName(uname);

            Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
            while (iterEmails.hasNext()) {
                JsonNode emailNode = iterEmails.next();
                String type = emailNode.get("type").asText();
                if (StringUtils.equals(type, "account")) {
                    member.setMemEmail(emailNode.get("value").asText());
                    break;
                }
            }

        } else if (this.sns.isNaver()) {
            JsonNode resNode = rootNode.get("response");
            member.setNaverid(resNode.get("id").asText());
            member.setMemEmail(resNode.get("email").asText());
        }

        return member;
    }
}
