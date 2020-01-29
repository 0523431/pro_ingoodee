package logic;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.ListDao;
import dao.PoohDao;
import dao.ItemDao;
import dao.SaleDao;
import dao.SaleItemDao;
import dao.UserDao;

@Service //@Component + service ��� : controller�� db�� �߰�����
public class ShopService {
	@Autowired //�������̳ʾ��� ��ü�� �ڷ����� ItemDao�� ���� ���� ->@service
	private ItemDao itemDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleItemDao saleItemDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private ListDao listDao;

	public List<Item> getItemList() {
		return itemDao.list();
	}

	public void itemCreate(Item item, HttpServletRequest request) { //item�� ������ ���
		//���ε�� �̹��� ������ ������ ��
		if(item.getPicture()!=null && !item.getPicture().isEmpty()) {
			//���� ���ε� : ���ε�� ������ ������ ���Ͽ� ����
			uploadFileCreate(item.getPicture(),request,"item/img/");
							// �� picture�� ����ȭ, �������
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.insert(item);
	}
	//��
	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		//picture : ���ε�� ������ ����
		String orgFile = picture.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/") + path; //������ �������
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs(); //�ش� path�������� ����
		try {
			//picture�� �ִ� �� ���Ϸ� ����
			picture.transferTo(new File(uploadPath + orgFile));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Item getItem(String string) {
		return itemDao.selectOne(string);
	}

	public void itemUpdate(Item item, HttpServletRequest request) {
		//���Ͼ��ε尡 ������ ���ε�, ������ db�� ����
		//������ �̹��� ����
		if(item.getPicture()!=null && !item.getPicture().isEmpty()) {
			uploadFileCreate(item.getPicture(),request,"item/img/");
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.update(item);
	}

	public void itemDelete(int id) {
		itemDao.delete(id);
	}

	public void userInsert(User user) {
		userDao.insert(user);
	}

	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}

	public Sale checkend(User loginUser, Cart cart) {
		Sale sale = new Sale();
		sale.setSaleid(saleDao.getMaxSaleId()); //saleid�� + 1
		sale.setUser(loginUser); //������ ����(�α�������)
		//sale.setUserid(loginUser.getUserid()); //������ id����
		sale.setUpdatetime(new Date());//�ֹ��ð�
		saleDao.insert(sale);
		//�ֹ���ǰ������ cart���� ��ȸ
		List<ItemSet> itemList = cart.getItemSetList();
		int i = 0;
		for(ItemSet is : itemList) {
			int saleItemId = ++i;//					1,			1,		ItemSet��ü
			SaleItem saleItem = new SaleItem(sale.getSaleid(),saleItemId,is);
			sale.getItemList().add(saleItem);//ù��° ��ǰ �߰�
			saleItemDao.insert(saleItem);//db�� �߰�
		}
		return sale;
	}

	public List<Sale> salelist(String id) {
		return saleDao.list(id); //����� id
	}

	public List<SaleItem> saleItemList(int saleid) {
		return saleItemDao.list(saleid); //saleid : �ֹ���ȣ
	}

	public void userupdate(User user) {
		userDao.update(user);
	}

	public void userDelete(String userid) {
		userDao.delete(userid);
	}

	public int boardcount() {
		return boardDao.count();
	}

	public List<Board> boardlist(Integer pageNum, int limit) {
		return boardDao.list(pageNum,limit);
	}

	public void boardWrite(Board board, HttpServletRequest request) {
		//÷�������� �����ϴ� ���
		if(board.getFile1()!=null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request, "board/file/");
			//���ε�� ���� �̸��� ����
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		//���� ��ϵ� �Խù� ��ȣ�� �ִ밪
		int max = boardDao.maxnum();
		board.setNum(++max);
		board.setGrp(max);
		boardDao.insert(board);
	}

	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail.shop")) {
			boardDao.readcntadd(num);
		}
		return boardDao.selectOne(num);
	}

	public List<Class> classList() {
		return listDao.list();
	}

	public Class classDetail(int cl_num) {
		return listDao.classDetail(cl_num);
	}
}