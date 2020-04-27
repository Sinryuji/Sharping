package service;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import exception.IdPasswordNotMatchingException;
import exception.PasswordNotMatchingException;
import vo.AuthInfo;
import vo.ChangeMemberVO;
import vo.ChangePwVO;
import vo.DeleteVO;
import vo.DeliveryAddressVO;
import vo.MemberVO;
import vo.ReviewVO;
import vo.SellerVO;
import vo.WishListVO;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	
	private Log log = LogFactory.getLog(MemberServiceImpl.class);
	@Autowired
	private JavaMailSender javaMailSender;
	
//	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);
	private static final String String =null;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

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
	public SellerVO searchSellerById(String id) {
		return memberDAO.selectSellerById(id);
	}

	@Override
	public AuthInfo login(String id, String password) {
		MemberVO memberVO = memberDAO.selectMemberById(id);
		SellerVO sellerVO = memberDAO.selectSellerById(id);
		
		if (memberVO == null) {
			throw new IdPasswordNotMatchingException();
		}
		if (!BCrypt.checkpw(password, memberVO.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}

		if (sellerVO == null) {
		return new AuthInfo(memberVO.getId(), memberVO.getEmail(), memberVO.getName(), "false", memberVO.getPhone());
		} else {
			return new AuthInfo(memberVO.getId(), memberVO.getEmail(), memberVO.getName(), "true", memberVO.getPhone());
		}

		}


	@Override
	public String sendSms(@RequestParam(required=false) String idd, @RequestParam String receiver, @RequestParam int random, HttpServletRequest req) {
	
		String id = memberDAO.selectIdByPhone(receiver);
		if(idd != null) {
		
		if(id == null) {
			return "noReciver";
			}
		}

		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		System.out.println(ran);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String sender="01096580540";

		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), 
				new UsernamePasswordCredentials("chjj", "3643d0c864f611eab34f0cc47a1fcfae"));

		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			String json = "{\"sender\":\""+sender+"\",\"receivers\":[\"" + receiver + "\"],\"content\":\""+authCode+"\"}";

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

	@Override
	public int updatePwByIdPw(ChangePwVO changePwVO) {
		MemberVO memberVO = memberDAO.selectMemberById(changePwVO.getId());
		String password = changePwVO.getPassword();
		if(BCrypt.checkpw(password, memberVO.getPassword())) {
			changePwVO.setPassword(memberVO.getPassword());
		} else {
			throw new PasswordNotMatchingException();
		}
		return memberDAO.updatePwByIdPw(changePwVO);
	}
	
	@Override
	public int updateMemberInfoById(ChangeMemberVO changeMemberVO) {
		return memberDAO.updateMemberInfoById(changeMemberVO);
	}
	
	@Override
	public int deleteMemberByIdPw(DeleteVO deleteVO) {
		MemberVO memberVO = memberDAO.selectMemberById(deleteVO.getId());
		String password = deleteVO.getPassword();
		if(!BCrypt.checkpw(password, memberVO.getPassword())) {
			throw new PasswordNotMatchingException();
		}       
		deleteVO.setPassword(memberVO.getPassword());
		return memberDAO.deleteMemberByIdPw(deleteVO);
	}
	
	@Override
	public int updateSellerInfoById(ChangeMemberVO changeMemberVO) {
		return memberDAO.updateSellerInfoById(changeMemberVO);
	}
	


	
	@Override
	public String sendEmail(String subject,String text,String from,String to, String filePath) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			if(filePath != null) {
				File file = new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			javaMailSender.send(message);
			return "true";
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return "false";
	}
	
	@Override
	public List<DeliveryAddressVO> selectDeliveryAddressById(String id) {
		return memberDAO.selectDeliveryAddressById(id);
	}
	
	@Override
	public int insertDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return memberDAO.insertDeliveryAddress(deliveryAddressVO);
	}
	
	@Override
	public int deleteDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return memberDAO.deleteDeliveryAddress(deliveryAddressVO);
	}
	
	@Override
	public int updateDeliveryAddress(DeliveryAddressVO deliveryAddressVO) {
		return memberDAO.updateDeliveryAddress(deliveryAddressVO);
	}
	
	@Override
	public DeliveryAddressVO selectDeliveryAddressBydaaNameId(DeliveryAddressVO deliveryAddressVO) {
		return memberDAO.selectDeliveryAddressBydaaNameId(deliveryAddressVO);
	}
	
	@Override
	public List<SellerVO> searchSellerByIds(String[] proId) {
		return memberDAO.searchSellerByIds(proId);
	}
	
	@Override
	public List<WishListVO> selectWishListByIdProductNum(WishListVO wishListVO) {
		return memberDAO.selectWishListByIdProductNum(wishListVO);
	}
	
	@Override
	public List<WishListVO> selectWishListById(WishListVO wishListVO) {
		return memberDAO.selectWishListById(wishListVO);
	}
	
	@Override
	public int insertWishList(WishListVO wishListVO) {
		return memberDAO.insertWishList(wishListVO);
	}
	
	@Override
	public int deleteWishListByIdProductNum(WishListVO wishListVO) {
		return memberDAO.deleteWishListByIdProductNum(wishListVO);
	}
	
	@Override
	public int insertReview(ReviewVO reviewVO) {
		return memberDAO.insertReview(reviewVO);
	}
	
	@Override
	public List<ReviewVO> selectReviewByOrderNumId(ReviewVO reviewVO) {
		return memberDAO.selectReviewByOrderNumId(reviewVO);
	}
	
	@Override
	public MemberVO selectMemberByEmail(String email) {
		return memberDAO.selectMemberByEmail(email);
	}

}
