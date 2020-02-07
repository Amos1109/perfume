package entity;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
//������Ʒ�ļ���
	private HashMap<items, Integer> goods;
//���ﳵ���ܽ��
	private double totalPrice;
	private int totalNumber;
	
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public Cart() {
		goods=new HashMap<items, Integer>();
		totalPrice=0.0;
	}
	public HashMap<items, Integer> getGoods() {
		return goods;
	}
	public void setGoods(HashMap<items, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	//�����Ʒ�����ﳵ�ķ���
	public boolean addGoodsInCart(items item,int number) {
		if(goods.containsKey(item)) {
			goods.put(item, goods.get(item)+number);
		}
		else {
			goods.put(item, number);
		}
		calTotalPrice();  //���¼��㹺�ﳵ���ܽ��
		calTotalNumber();
		return true;
	}
	//ɾ����Ʒ�ķ���
	public boolean removeGoodsFromCart(items item) {
		goods.remove(item);
		calTotalPrice();
		calTotalNumber();
		return true;
	}
	
	//ͳ�ƹ��ﳵ���ܽ��
	public double calTotalPrice() {
		double sum=0.0;
		Set<items>keys=goods.keySet();//��ü��ļ���
		Iterator<items> it=keys.iterator();//��õ���������
		while(it.hasNext()) {
			items i=it.next();
			sum+=i.getPrice()*goods.get(i);
		}
		this.setTotalPrice(sum); //���ù��ﳵ���ܽ��
		return this.getTotalPrice();
	}
	//ͳ��������
	public int  calTotalNumber() {
		int sum=0;
		Set<items>keys=goods.keySet();
		Iterator<items>it=keys.iterator();
		while(it.hasNext()) {
			items i=it.next();
			sum+=goods.get(i);
		}
		this.setTotalNumber(sum);
		return this.getTotalNumber();
	}
}
