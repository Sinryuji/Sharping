package service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import dao.MemberDAO;
import exception.IdPasswordNotMatchingException;
import vo.AuthInfo;
import vo.ChangePwVO;
import vo.MemberVO;
import vo.SellerVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	static public int rand;

	private MemberDAO memberDAO;

	public MemberDAO getMemberDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public int registMember(MemberVO memberVO) {
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public int registSeller(SellerVO sellerVO) {
		return memberDAO.insertSeller(sellerVO);

	}

	@Override
	public String searchIdByEmail(String email) {
		return memberDAO.selectIdByEmail(email);
	}

	@Override
	public String searchIdByPhone(String phone) {
		return memberDAO.selectIdByPhone(phone);
	}

	@Override
	public int changePwByEmail(ChangePwVO changePwVO) {
		return memberDAO.updatePwByEmail(changePwVO);
	}

	@Override
	public int changePwByPhone(ChangePwVO changePwVO) {
		return memberDAO.updatePwByPhone(changePwVO);
	}

	@Override
	public MemberVO searchMemberById(String id) {
		return memberDAO.selectMemberById(id);
	}

	@Override
	public AuthInfo login(String id, String password) {
		MemberVO memberVO = memberDAO.selectMemberById(id);
		if (memberVO == null) {
			throw new IdPasswordNotMatchingException();
		}
		if(!BCrypt.checkpw(password, memberVO.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(memberVO.getId(), memberVO.getEmail(), memberVO.getName());
		}

	@Override
	public String sendSms(String receiver) {
		// 6자리 인증 코드 생성
		rand = (int) (Math.random() * 899999) + 100000;
		
		String sender="01096580540";

		// 인증 코드를 데이터베이스에 저장하는 코드는 생략했습니다.

		// 문자 보내기
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),

				// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다.
				new UsernamePasswordCredentials("jcyy", "832390da643911ea986f0cc47a1fcfae"));

		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			// 문자에 대한 정보
			String json = "{\"sender\":\""+sender+"\",\"receivers\":[\"" + receiver + "\"],\"content\":\""+rand+"\"}";

			StringEntity se = new StringEntity(json, "UTF-8");

			httpPost.setEntity(se);

			HttpResponse httpResponse = client.execute(httpPost, context);
			InputStream inputStream = httpResponse.getEntity().getContent();

			if (inputStream != null) {
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				while ((line = bufferedReader.readLine()) != null) {
					System.out.println(line);
				}
				inputStream.close();
				return "true";
			} else {
				return "false";
			}
				
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client.getConnectionManager().shutdown();
		}
		return "true";
		 
	}

	
	@Override
	public int idCheck(String id) {
		int result = memberDAO.selectMemberId(id);
		return result;
	}
}
	

