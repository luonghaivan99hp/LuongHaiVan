package Ex2_question5;

public abstract class dienthoaididong implements vukhi {
	   public void nghe(){
	       System.out.println("Đang nghe......");
	   }
	   public void goi(){
	       System.out.println("Đang gọi.......");
	   }
	   public void soantn(){
	       System.out.println("Đang soạn tin nhắn...");
	   }
	   public void guitn(){
	       System.out.println("Đang gửi tin nhắn...");
	   }

	    @Override
	    public abstract void tancongkexau();
	   
	}
// interface va aptract: giong nhau khong tao dc cac 
//interface : khong chua cac thuoc tinh
//aptract: co tao dc cac thuoc tinh
//interface :public abstract methed()
// interface bo cac hanh vi
