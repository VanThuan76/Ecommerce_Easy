import ImageHomeIntroduction from "@/shared/components/images/ImageHomeIntroduction";
import WebsiteLayout from "@/shared/layout/WebsiteLayout";
import { Button } from "antd";

const Home = () => {
  return (
    <WebsiteLayout>
      <div className="w-full h-full grid grid-cols-5 justify-start items-center">
        <div className="col-span-3 w-full flex flex-col gap-3 justify-center items-center">
          <h1 className="font-bold text-5xl">Món Bán Chạy</h1>
          <p className="text-lg">
            Chỉ cần ngửi mùi thơm của nước dùng cũng đủ để cảm thấy ngất ngây.
            Các hương vị của thịt, xương, rau thơm quyện vào nhau tạo nên mùi
            thơm đặc biệt đi vào lòng người. Thịt thì mềm, bánh thì dẻo, thỉnh
            thoảng lại thấy cái cay dịu của gừng, cái cay nồng của ớt, cái thơm
            nhè nhẹ của rau thơm, và mùi thơm nồng của hành lá. Tất cả hòa quyện
            một cảnh ngọt ngào, tạo nên vị thơm ngon đặc trưng của món phở.
          </p>
          <Button color="green">Xem thêm</Button>
        </div>
        <ImageHomeIntroduction />
      </div>
    </WebsiteLayout>
  );
};

export default Home;
